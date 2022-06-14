package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.example.demo.domain.Company;
import com.example.demo.domain.Coupon;
import com.example.demo.domain.Course;
import com.example.demo.domain.Place;
import com.example.demo.service.CompanyService;
import com.example.demo.service.CouponService;
import com.example.demo.service.CourseService;
import com.example.demo.service.PlaceService;
import com.example.demo.validator.CourseValidator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
@SessionAttributes("course")
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private PlaceService placeService;
	
	//MemberCouponButton
	@Autowired
	private CouponService couponService;
	@Autowired
	private CompanyService companyService;
	@Getter @Setter @AllArgsConstructor @ToString
	public class MemberCouponButton {
		private String placeName;
		private Coupon coupon;
	}
	
	
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
		
		
		
		System.out.println("=========inserted course=========");
		System.out.println(course.toString());
		System.out.println("=============================");
		//System.out.println(courseService.getCourseByCourseId(course.getCourseId()));
		System.out.println("submit complete!!!");
		
		return "course/view";
	}
	
	@RequestMapping(value="/view/{courseId}", method=RequestMethod.GET)
	public ModelAndView viewDetail(@ModelAttribute Course course) {
		ModelAndView mav = new ModelAndView("course/view");
		
		Course viewCourse = courseService.getCourseByCourseId(course.getCourseId());
		mav.addObject("course", viewCourse);
		
		Place place1 = placeService.getPlaceByPlaceId(viewCourse.getPlace1().getPlaceId());
		mav.addObject("place1", place1);
		System.out.println(place1.getPlaceName());
		
		if (viewCourse.getPlace2()!=null) {
			Place place2 = placeService.getPlaceByPlaceId(viewCourse.getPlace2().getPlaceId());
			mav.addObject("place2", place2);
			System.out.println(place2.getPlaceName());
		}
		if (viewCourse.getPlace3()!=null) {
			Place place3 = placeService.getPlaceByPlaceId(viewCourse.getPlace3().getPlaceId());
			mav.addObject("place3", place3);
			System.out.println(place3.getPlaceName());
		}
		
		
		System.out.println("=========view Detail=========");
		System.out.println(viewCourse.toString() + "\n");
		System.out.println("=============================");
		
		
		//MemberCouponButton
		ArrayList<MemberCouponButton> mcb = new ArrayList<MemberCouponButton>();
						
		Place[] arr = {course.getPlace1(), course.getPlace2(), course.getPlace3()};
		for (Place p : arr) {
			if (p != null) {
				int id = p.getPlaceId();
				Company com = companyService.getCompanyByPlaceId(id);
								
				if (com != null) {
					List<Coupon> cou = couponService.getCouponByCompanyId(com.getCompanyId());
					for (Coupon c : cou) {
						mcb.add(new MemberCouponButton(com.getPlace().getPlaceName(), c));
					}
				}			
			}
		}		
		mav.addObject("couponList", mcb);
		
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
