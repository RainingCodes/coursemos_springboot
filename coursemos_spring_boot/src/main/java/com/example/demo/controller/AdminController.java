package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Report;
import com.example.demo.service.ReportService;

@Controller
public class AdminController {
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/admin")
	public String adminPage() {
		return "admin/index";
	}
	
	@RequestMapping("/admin/report/course")
	public ModelAndView adminReportCourse() {
		ModelAndView mav = new ModelAndView("admin/report");
		
		List<Report> list = reportService.getAllCourseReport();
		mav.addObject("reportList", list);
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
		mav.addObject("reportList", list);
		mav.addObject("type", "review");
		
		return mav;
	}
	
	@RequestMapping("/admin/company")
	public ModelAndView adminCompany() {
		ModelAndView mav = new ModelAndView("admin/report");
		
		List<Report> list = reportService.getAllCourseReport();
		mav.addObject("reportList", list);
		mav.addObject("type", "course");
		
		return mav;
	}
}
