package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {
	
	ModelAndView mav;
	
	@RequestMapping("course/registerForm")
	public ModelAndView writeCourse() {
		mav = new ModelAndView("/course/registerForm");
		return mav;
	}

	@RequestMapping("course/view")
	public ModelAndView viewCourse() {
		mav = new ModelAndView("/course/view");
		return mav;
	}
	
	@RequestMapping("course/list")
	public ModelAndView viewCourseList() {
		mav = new ModelAndView("/course/list");
		return mav;
	}
//	
//	@GetMapping
//	public String writeCourseForm() {
//		return "course/writeCourse";
//	}
//	
//	@PostMapping
//	@ResponseBody
//	public String writeCourse(@RequestBody String body) {
//		System.out.println("Request Body: " + body);
//		return body;
//	}
}
