package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.service.CourseService;
import com.example.demo.validator.CourseValidator;

@Controller
@SessionAttributes("course")
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@ModelAttribute("course")
	public Course formBacking(HttpServletRequest request) {
		Course course = new Course();
		return course;
	}
	
	@RequestMapping("registerForm")
	public ModelAndView init() {
		ModelAndView mav = new ModelAndView("/course/registerForm");
		return mav;
	}
	
	@RequestMapping(value="/view/1", method=RequestMethod.POST)
	public String submit(@ModelAttribute Course course, BindingResult result, SessionStatus status, HttpServletRequest request) {
		new CourseValidator().validate(course, result);
		if (result.hasErrors()) {
			System.out.println("Validation Error !!!");
			return "course/registerForm";
		}

		System.out.println("courseName은 " +request.getParameter("courseName"));
		
		System.out.println(course.toString());
		
		//courseService.insertCourse(course);
//		
//		SessionCourse sessionCourse = new SessionCourse(course.getCourseId(), course.getCourseName(), course.getCourseContents(), course.getMemberId(), course.getTaste(), course.getLikes(), course.getWrittenDate(), course.getPlaceId1(), course.getPlaceId2(), course.getPlaceId3());
//		status.setComplete();
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("courseSession", sessionCourse);
//		
		System.out.println("submit complete!!!");
		
		return "/course/view";
	}
	

//	
//	@Autowired
//	private CourseService courseService;
//	

//	
//	ModelAndView mav;
//	
//	@RequestMapping("registerForm")
//	public ModelAndView writeCourse() {
//		mav = new ModelAndView("/course/registerForm");
//		return mav;
//	}
//	
//	@RequestMapping(method=RequestMethod.POST)
//	public String submit(@ModelAttribute Course course, BindingResult result, SessionStatus status, HttpServletRequest request) {
//		new CourseValidator().validate(course, result);
//		
//		if (result.hasErrors()) {
//			return "course/registerForm";
//		}
//		
//		courseService.insertCourse(course);
//		SessionCourse sessionCourse = new SessionCourse(course.getCourseId(), course.getCourseName(), course.getCourseContents(), course.getMemberId(), course.getTaste(), course.getLikes(), course.getWrittenDate(), course.getPlaceId1(), course.getPlaceId2(), course.getPlaceId3());
//		status.setComplete();
//		HttpSession session = request.getSession();
//		session.setAttribute("courseSession", sessionCourse);
//		return "view/1";
//	}
//
//
//	@RequestMapping("view/{courseId}")
//	public ModelAndView viewCourse() {
//		//courseId로 코스 상세정보 불러와서 화면에 출력
//		
//			
//		
//		mav = new ModelAndView("/course/view");
//		return mav;
//	}
	
}
