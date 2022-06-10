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

import com.example.demo.domain.Report;
import com.example.demo.service.ReportService;
import com.example.demo.validator.ReportValidator;

import lombok.*;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	
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
		
		//서비스로 게시글 제목, 글쓴이 가져오는 것 나중에 구현해서 모델에 연결해서 리턴
		model.addAttribute("reportTitle", "test");
		model.addAttribute("reportUserName", "test2");
		
		return "report/courseReport";
	}
	
	@RequestMapping(value = "/report/course/{courseId}", method = RequestMethod.POST)
	public String courseReportRegister(@PathVariable int courseId,
			@ModelAttribute("Report") Report courseReport, BindingResult result) {
		
		new ReportValidator().validate(courseReport, result);
		if (result.hasErrors()) {
			return "report/courseReport";
		}

		courseReport.setCourseId(courseId);
		courseReport.setReviewId(null);
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
		courseReport.setWrittenDate(current);
		courseReport.setState("F");
		courseReport.setMemberId(7); // 세션 완성되면 설정하기
		reportService.insertReport(courseReport);
		
		return "redirect:"; //코스 상세 jsp 나오면 다시 돌아가도록 설정
	}
	
	@RequestMapping(value = "/report/review/{reviewId}", method = RequestMethod.GET)
	public String reviewReportForm(@PathVariable String reviewId, Model model) {
		model.addAttribute("reviewId", reviewId);
		//서비스로 게시글 제목, 글쓴이 가져오는 것 나중에 구현해서 모델에 연결해서 리턴
		model.addAttribute("reportTitle", "test");
		model.addAttribute("reportUserName", "test2");
		
		return "report/reviewReport";
	}
	
	@RequestMapping(value = "/report/review/{reviewId}", method = RequestMethod.POST)
	public String reviewReportRegister(@PathVariable String reviewId,
			@ModelAttribute("Report") Report courseReport) {
		
		//서비스 구현해서 report값 return하고 원래 review게시글로 이동
		
		return "redirect:"; //코스 상세 jsp 나오면 다시 돌아가도록 설정
	}
}
