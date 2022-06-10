package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.service.CourseService;
import com.example.demo.validator.CourseValidator;

@Controller
@SessionAttributes("course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@ModelAttribute("course")
	public Course formBacking(HttpServletRequest request) {
		Course course = new Course();
		return course;
	}
	
	ModelAndView mav;
	
	@RequestMapping("course/registerForm")
	public ModelAndView writeCourse() {
		mav = new ModelAndView("/course/registerForm");
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(@ModelAttribute Course course, Errors result, SessionStatus status) {
		new CourseValidator().validate(course, result);
		
		if (result.hasErrors()) {
			return "course/registerForm";
		}
		
		System.out.println(course);
		
		status.setComplete();
		return "view/1";
	}


	@RequestMapping("course/view/{courseId}")
	public ModelAndView viewCourse() {
		//courseId로 코스 상세정보 불러와서 화면에 출력
		
			
		
		mav = new ModelAndView("/course/view");
		return mav;
	}
}
