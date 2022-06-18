package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.Place;
import com.example.demo.service.CourseService;
import com.example.demo.service.PlaceService;

@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/course")
public class UpdateCourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private PlaceService placeService;
	
	@RequestMapping(value="/update/{courseId}", method=RequestMethod.POST)
	public ModelAndView updateCourse(@ModelAttribute Course course,  @PathVariable("courseId") int courseId, HttpServletRequest request) {
		Course updateCourse = courseService.getCourseByCourseId(courseId);
		ModelAndView mav = new ModelAndView("course/updateForm");
		mav.addObject("updateCourse", updateCourse);
		
		System.out.println(updateCourse.toString());
		return mav;
	}
	
	@RequestMapping(value="/view/{courseId}", method=RequestMethod.POST)
	public ModelAndView updateSubmit(@ModelAttribute Course course, @PathVariable("courseId") int courseId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/course/view/"+courseId);
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(course.toString());
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!");

		
		System.out.println(course.getPlace2());
		
		//		
//		if (course.getPlace2().getPlaceId() !=null) {
//			Place place2 = placeService.getPlaceByPlaceId(course.getPlace2().getPlaceId());
//			System.out.println(place2.toString());
//			if(place2.getTaste() == null) { // 빈 place는 db에서 삭제
//				placeService.deletePlace(place2);	
//				course.setPlace1(new Place());
//			}
//		}
//		
//		if (course.getPlace3().getPlaceId() !=null) {
//			Place place3 = placeService.getPlaceByPlaceId(course.getPlace3().getPlaceId());			
//			if(place3.getTaste() == null) {
//				placeService.deletePlace(place3);	
//				course.setPlace2(new Place());
//			}
//		}

		courseService.updateCourse(course);
		
		return mav;
	}
}
