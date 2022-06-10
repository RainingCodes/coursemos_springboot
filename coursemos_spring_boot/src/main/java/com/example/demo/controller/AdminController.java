package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/admin/report/review")
	public ModelAndView adminReportReview() {
		ModelAndView mav = new ModelAndView("admin/report");
		
		List<Report> list = reportService.getAllReviewReport();
		mav.addObject("reportList", list);
		mav.addObject("type", "review");
		
		return mav;
	}
}
