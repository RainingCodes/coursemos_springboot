package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="/registerForm", method=RequestMethod.GET)
	public void init() {

	}
	
	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String onSubmit(@ModelAttribute Course course, BindingResult result, SessionStatus status, HttpServletRequest request) {
		new CourseValidator().validate(course, result);
		
		if (result.hasErrors()) {
			System.out.println("Validation Error !!!");
			return "course/registerForm";
		}
		courseService.insertCourse(course);
		//System.out.println(courseService.getCourseByCourseId(course.getCourseId()));
		System.out.println("submit complete!!!");	
		return "course/view";
	}
	
	@RequestMapping(value="/view/{courseId}", method=RequestMethod.GET)
	public ModelAndView viewDetail(@ModelAttribute Course course) {
		ModelAndView mav = new ModelAndView("course/view");
		
		Course viewCourse = courseService.getCourseByCourseId(course.getCourseId());
		mav.addObject("course", viewCourse);
		
		System.out.println("=========view Detail=========");
		System.out.println(viewCourse.toString() + "\n");
		System.out.println("=============================");
		
		return mav;

	}
	
//	//추후 수정
//	@RequestMapping(value="/view/0", method=RequestMethod.GET)
//	public String onClickShare(@ModelAttribute Course course, BindingResult result, SessionStatus status, HttpServletRequest request) {
//		courseService.getCourseByCourseId(0);
//		course.toString();
//		return "course/view";
//	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public void deleteCourse(@ModelAttribute Course course, BindingResult result, SessionStatus status, HttpServletRequest request) {
		courseService.deleteCourse(course);
		System.out.println(course.getCourseId() + " : delete complete!!!");
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
