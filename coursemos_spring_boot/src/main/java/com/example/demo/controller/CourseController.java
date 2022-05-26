package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;

@Controller
public class CourseController {
	
	@ModelAttribute("Course")
	public Course formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Course course = new Course();
			
			
			
			
			
			return course;
		}
		return new Course();
	}
		
	
	ModelAndView mav;
	
//	@RequestMapping(value="course/registerForm", method=RequestMethod.GET)
//	public String courseForm(Model model) {
//		return "course/"
//	}
	
	@RequestMapping("course/registerForm")
	public ModelAndView writeCourse() {
		mav = new ModelAndView("/course/registerForm");
		return mav;
	}
//	@RequestMapping(value="course/registerForm", method=RequestMethod.POST)
//	public ModelAndView writeCourse() {
//		mav = new ModelAndView("/course/registerForm");
//		return mav;
//	}

	@RequestMapping("course/view/{courseId}")
	public ModelAndView viewCourse() {
		//courseId로 코스 상세정보 불러와서 화면에 출력
		
			
		
		mav = new ModelAndView("/course/view");
		return mav;
	}
	
	@RequestMapping("course/list")
	public ModelAndView viewCourseList() {		
		mav = new ModelAndView("/course/list");
		return mav;
	}
}
