package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.Member;
import com.example.demo.domain.Report;
import com.example.demo.domain.Review;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CourseService;
import com.example.demo.service.MemberService;
import com.example.demo.service.ReportService;
import com.example.demo.service.ReviewService;
import com.example.demo.validator.ReportValidator;

import lombok.*;

@Controller
@SessionAttributes("sessionMember")
public class ReportController {
	@Autowired
	private ReportService reportService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private MemberService memberService;
	
	@Getter @Setter @AllArgsConstructor
	public class ReportCodes {
		public String code;
		public String label;
	}
	
	@ModelAttribute("ReportCodes")
	protected List<ReportCodes> referenceData1() throws Exception {
		List<ReportCodes> ReportCodes = new ArrayList<ReportCodes>();
		ReportCodes.add(new ReportCodes("spam","스팸홍보/도배글입니다."));
		ReportCodes.add(new ReportCodes("lie", "허위 정보를 담고있습니다."));
		ReportCodes.add(new ReportCodes("mali","악의적 비하 내용을 담고있습니다."));
		ReportCodes.add(new ReportCodes("unpl","불쾌한 표현이 있습니다."));
		ReportCodes.add(new ReportCodes("ille","불법 정보를 포함하고 있습니다."));
		return ReportCodes;
	}
	
	@ModelAttribute("Report")
	public Report formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Report courseReport = new Report();
			courseReport.setReportCategory(null);
			return courseReport;
		}
		else return new Report();
	}
	
	@RequestMapping(value = "/report/course/{courseId}", method = RequestMethod.GET)
	public String courseReportForm(@PathVariable int courseId, Model model) {
		model.addAttribute("courseId", courseId);
		Course c = courseService.getCourseByCourseId(courseId);
		Member m = memberService.findMemberById(c.getMemberId());
		
		model.addAttribute("reportTitle", c.getCourseName());
		if (m != null) {
			model.addAttribute("reportUserName", m.getNickName());
		}
		return "report/courseReport";
	}
	
	@RequestMapping(value = "/report/course/{courseId}", method = RequestMethod.POST)
	public ModelAndView courseReportRegister(@PathVariable int courseId, @ModelAttribute SessionMember sessionMember,
			@ModelAttribute("Report") Report courseReport, BindingResult result) {
		
		new ReportValidator().validate(courseReport, result);
		if (result.hasErrors()) {
			ModelAndView mav = new ModelAndView("report/courseReport");
			Course c = courseService.getCourseByCourseId(courseId);
			Member m = memberService.findMemberById(c.getMemberId());
			
			mav.addObject("reportTitle", c.getCourseName());
			if (m != null) {
				mav.addObject("reportUserName", m.getNickName());
			}
			return mav;
		}
		
		ModelAndView mav = new ModelAndView("alert");

		courseReport.setCourseId(courseId);
		courseReport.setReviewId(null);
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
		courseReport.setWrittenDate(current);
		courseReport.setState("F");
		courseReport.setMemberId(sessionMember.getId()); // 세션 완성되면 설정하기
		reportService.insertReport(courseReport);
		
		mav.addObject("msg", "코스 신고 완료!");
		mav.addObject("url", "closePage");
		return mav;
	}
	
	
	@RequestMapping(value = "/report/review/{reviewId}", method = RequestMethod.GET)
	public String reviewReportForm(@PathVariable Long reviewId, Model model) {
		model.addAttribute("reviewId", reviewId);
		Review r = reviewService.findReviewById(reviewId);
		Member m = memberService.findMemberById(r.getMemberId());
		model.addAttribute("reportTitle", r.getReviewContents());
		model.addAttribute("reportUserName", m.getNickName());
		
		return "report/reviewReport";
	}
	
	@RequestMapping(value = "/report/review/{reviewId}", method = RequestMethod.POST)
	public ModelAndView reviewReportRegister(@PathVariable Long reviewId, @ModelAttribute SessionMember sessionMember,
			@ModelAttribute("Report") Report reviewReport, BindingResult result) {
		
		new ReportValidator().validate(reviewReport, result);
		if (result.hasErrors()) {
			ModelAndView mav = new ModelAndView("report/reviewReport");
			Review r = reviewService.findReviewById(reviewId);
			Member m = memberService.findMemberById(r.getMemberId());
			mav.addObject("reportTitle", r.getReviewContents());
			mav.addObject("reportUserName", m.getNickName());
			return mav;
		}
		
		ModelAndView mav = new ModelAndView("alert");

		reviewReport.setCourseId(null);
		reviewReport.setReviewId(reviewId);
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    reviewReport.setWrittenDate(current);
	    reviewReport.setState("F");
	    reviewReport.setMemberId(sessionMember.getId()); // 세션 완성되면 설정하기
		reportService.insertReport(reviewReport);
		
		mav.addObject("msg", "리뷰 신고 완료!");
		mav.addObject("url", "closePage");
		return mav;
	}
	
	
	@RequestMapping("/member/report/list")
	public ModelAndView scrapList(@ModelAttribute SessionMember sessionMember) {
		ModelAndView mav = new ModelAndView("member/reportList");
		
		List<Report> list = reportService.getReportByMemberId(sessionMember.getId()); // 세션 완성되면 설정하기
		mav.addObject("list", list);
		
		return mav;
	}
}