package com.example.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Company;
import com.example.demo.domain.Course;
import com.example.demo.domain.Member;
import com.example.demo.domain.Points;
import com.example.demo.domain.Report;
import com.example.demo.domain.Review;
import com.example.demo.domain.ReviewLike;
import com.example.demo.domain.ReviewReadableMember;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CourseService;
import com.example.demo.service.MemberService;
import com.example.demo.service.PointsService;
import com.example.demo.service.CompanyService;
import com.example.demo.service.ReportService;
import com.example.demo.service.ReviewLikeService;
import com.example.demo.service.ReviewReadableMemberService;
import com.example.demo.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Controller
@SessionAttributes("sessionMember")
public class AdminController {
	@Autowired
	private ReportService reportService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private PointsService pointsService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewLikeService reviewLikeService;
	@Autowired
	private ReviewReadableMemberService reviewReadableMemberService;
	
	@RequestMapping("/admin")
	public String adminPage(@ModelAttribute SessionMember sessionMember) {
		
		if (sessionMember.getId().equals(0L)) {
			return "admin/index";
		} else {
			return "admin/err";
		}
	}
	
	
	
	@Getter @Setter  @NoArgsConstructor @AllArgsConstructor @ToString
	public class ReportView {
		private int reportId;
		private String reportCategory;
		private String nickname;
		private Long id;
		private boolean existPost;
		private boolean state;
	}
	
	@RequestMapping("/admin/report/course")
	public ModelAndView adminReportCourse() {
		ModelAndView mav = new ModelAndView("admin/report");
		
		List<Report> list = reportService.getAllCourseReport();
		ArrayList<ReportView> arr = new ArrayList<ReportView>();
		for(Report r : list) {
			ReportView rv = new ReportView();
			rv.setReportId(r.getReportId());
			rv.setReportCategory(r.getReportCategory());
			rv.setNickname(memberService.findMemberById(r.getMemberId()).getNickName());
			rv.setId(r.getCourseId().longValue());
			
			if (courseService.getCourseByCourseId(r.getCourseId()) == null) {
				rv.setExistPost(false);
			} else {
				rv.setExistPost(true);
			}
			
			if (r.getState().equals("F")) {
				rv.setState(false);
			} else {
				rv.setState(true);
			}
			arr.add(rv);
		}
		mav.addObject("reportList", arr);
		mav.addObject("type", "course");
		
		return mav;
	}	
	
	@RequestMapping("/admin/report/*/process")
	public String reportProcess(@RequestParam("reportId") int reportId) {
		// 추가 구현 할 사항
		// 1. 게시글 작성자 포인트 깎기 기능(이건 다른 jpa에서 가져오기)
		// 2. 게시글 삭제 기능(이건 다른 jpa에서 가져오기)
		Report report = reportService.getReportById(reportId);
		report.setState("T");
		reportService.updateReport(report);
		
		if (report.getCourseId() != null) {
			return "redirect:/admin/report/course";
		} else {
			return "redirect:/admin/report/review";
		}
	}
	
	@RequestMapping("/admin/report/review")
	public ModelAndView adminReportReview() {
	
		ModelAndView mav = new ModelAndView("admin/report");
		
		List<Report> list = reportService.getAllReviewReport();
		ArrayList<ReportView> arr = new ArrayList<ReportView>();
		for(Report r : list) {
			ReportView rv = new ReportView();
			rv.setReportId(r.getReportId());
			rv.setReportCategory(r.getReportCategory());
			rv.setNickname(memberService.findMemberById(r.getMemberId()).getNickName());
			rv.setId(r.getReviewId());
			
			if (reviewService.findReviewById(r.getReviewId()) == null) {
				rv.setExistPost(false);
			} else {
				rv.setExistPost(true);
			}
			
			if (r.getState().equals("F")) {
				rv.setState(false);
			} else {
				rv.setState(true);
			}
			arr.add(rv);
		}
		mav.addObject("reportList", arr);
		mav.addObject("type", "review");
		
		return mav;
	}
	
	@RequestMapping("/admin/company")
	public ModelAndView adminCompany() {
		ModelAndView mav = new ModelAndView("admin/company");
		
		List<Company> list = companyService.getAllCompany();
		mav.addObject("companyList", list);
		
		return mav;
	}
	
	@RequestMapping("/admin/report/course/remove")
	public String courseDelete(@RequestParam("courseId") int courseId,
			@RequestParam("reportId") Integer reportId) {
		Course course = courseService.getCourseByCourseId(courseId);
		
		Long writerId = course.getMemberId();
		courseService.deleteCourse(course);	
		
		if (writerId != null) {
			Points points = new Points();
			
			java.util.Date date = new java.util.Date();
			long timeInMilliSeconds = date.getTime();
			points.setPointsDate(new Date(timeInMilliSeconds));
			points.setType(4);
			points.setMemberId(writerId);
			
			Member member= memberService.findMemberById(writerId);
			int nowPoint = member.getPoints();
			if (nowPoint < 20) {
				points.setPoints(nowPoint);
			} else {
				points.setPoints(20);
			}
			
			member.setPoints(member.getPoints() - nowPoint);
			pointsService.insertPoints(points);
		}
		return "redirect:/admin/report/course";
	}
	
	@RequestMapping("/admin/report/review/remove")
	public String reviewDelete(@RequestParam("reviewId") Long reviewId,
			@RequestParam("reportId") Integer reportId) {
		Review review = reviewService.findReviewById(reviewId);
		
		Long writerId = review.getMemberId();
		
		List<ReviewLike> rll = reviewLikeService.findReviewLikeByReviewId(reviewId);
		if(rll != null) {
			for(ReviewLike rl : rll) {
				reviewLikeService.delete(rl);
			}
		}
		List<ReviewReadableMember> rrml= reviewReadableMemberService.findReviewReadableMemberByReviewId(reviewId);
		if(rrml != null) {
			for(ReviewReadableMember rrm : rrml) {
				reviewReadableMemberService.delete(rrm);
			}
		}
		reviewService.delete(review);
		
		Points points = new Points();
		
		java.util.Date date = new java.util.Date();
		long timeInMilliSeconds = date.getTime();
		points.setPointsDate(new Date(timeInMilliSeconds));
		points.setType(5);
		points.setMemberId(writerId);
		
		Member member= memberService.findMemberById(writerId);
		int nowPoint = member.getPoints();
		if (nowPoint < 20) {
			points.setPoints(nowPoint);
		} else {
			points.setPoints(20);
		}
		
		member.setPoints(member.getPoints() - nowPoint);
		pointsService.insertPoints(points);
		
		return "redirect:/admin/report/review";
	}
	
	@RequestMapping("/admin/company/process")
	public String companyProcess(@RequestParam("companyId") Long companyId,
			@RequestParam("accept") int accept) {
		
		Company company = companyService.getCompanyByCompanyId(companyId);
		company.setAccept(accept);
		companyService.updateCompany(company);

		return "redirect:/admin/company";
	}
}
