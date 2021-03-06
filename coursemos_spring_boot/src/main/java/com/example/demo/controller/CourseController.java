package com.example.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.controller.RegisterMemberController.Taste;
import com.example.demo.domain.Company;
import com.example.demo.domain.Coupon;
import com.example.demo.domain.Course;
import com.example.demo.domain.Member;
import com.example.demo.domain.Place;
import com.example.demo.domain.Points;
import com.example.demo.domain.Review;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CompanyService;
import com.example.demo.service.CouponService;
import com.example.demo.service.CourseLikeService;
import com.example.demo.service.CourseService;
import com.example.demo.service.MemberService;
import com.example.demo.service.PlaceService;
import com.example.demo.service.PointsService;
import com.example.demo.service.ReviewService;
import com.example.demo.service.ScrapService;
import com.example.demo.validator.CourseValidator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private PointsService pointsService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CourseLikeService courseLikeService;
	@Autowired
	private ScrapService scrapService;
	
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
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Course course = new Course();
			return course;
		}
		else return new Course();
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String init() {
		return "course/registerForm";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String onSubmit(@ModelAttribute SessionMember sessionMember, @ModelAttribute Course course, BindingResult result) {
		new CourseValidator().validate(course, result);
		
		if (result.hasErrors()) {
			System.out.println("Validation Error !!!");
			return "course/registerForm";
		}
		
		course.getPlace1().setTaste(course.getTaste());
		if (course.getPlace2() != null) course.getPlace2().setTaste(course.getTaste());
		if (course.getPlace3() != null) course.getPlace3().setTaste(course.getTaste());
		course.setMemberId(sessionMember.getId());
		
		java.util.Date date = new java.util.Date();
		long timeInMilliSeconds = date.getTime();

		course.setWrittenDate(new Date(timeInMilliSeconds));
		courseService.insertCourse(course);
		
		Points points = new Points();
		points.setMemberId(sessionMember.getId());
		points.setPointsDate(new Date(timeInMilliSeconds));
		points.setType(1);
		
		Member member= memberService.findMemberById(sessionMember.getId());
		member.insertPoints(points);
		member.setPoints(member.getPoints() + 20);
		pointsService.insertPoints(points);
		List<Points> pointList = pointsService.findAllByMemberId(sessionMember.getId());
		
		sessionMember.setPoints(sessionMember.getPoints() + 20);
		sessionMember.setPointList(pointList);
		memberService.save(member);
		
		System.out.println("=========inserted course=========");
		System.out.println(course.toString());
		System.out.println("submit complete!!!");
		System.out.println("=================================");
		
		return "redirect:/course/view/"+course.getCourseId();
	}
	
	@RequestMapping("/list")
	public ModelAndView courseList() {
		ModelAndView mav = new ModelAndView("/course/list");
		
		List<Course> courses = courseService.getCourseList();
		mav.addObject("courseList", courses);
		
		return mav;
	}
	
	@RequestMapping(value="/view/{courseId}", method=RequestMethod.GET)
	public ModelAndView viewDetail(@ModelAttribute SessionMember sessionMember, @PathVariable("courseId") int courseId) {
		ModelAndView mav = new ModelAndView("course/view");
		
		Course viewCourse = courseService.getCourseByCourseId(courseId);
		mav.addObject("course", viewCourse);

			Place place1 = placeService.getPlaceByPlaceId(viewCourse.getPlace1().getPlaceId());
			mav.addObject("place1", place1);
			System.out.println(place1.getPlaceName());
			
			if (viewCourse.getPlace2()!=null) {
				Place place2 = placeService.getPlaceByPlaceId(viewCourse.getPlace2().getPlaceId());
				mav.addObject("place2", place2);
				System.out.println(place2.getPlaceName());
			}
			else { // place2??? null??? ?????? ??? place ?????? ?????????
				mav.addObject("place2", new Place());
				System.out.println("place2 is null");
			}
			
			if (viewCourse.getPlace3()!=null) {
				Place place3 = placeService.getPlaceByPlaceId(viewCourse.getPlace3().getPlaceId());
				mav.addObject("place3", place3);
				System.out.println(place3.getPlaceName());
			}
			else { // place2??? null??? ?????? ??? place ?????? ?????????
				mav.addObject("place3", new Place());
				System.out.println("place3 is null");
			}	
		
		System.out.println("=========view Detail=========");
		System.out.println(viewCourse.toString());
		System.out.println("=============================");
		
		//MemberCouponButton
	      ArrayList<MemberCouponButton> mcb = new ArrayList<MemberCouponButton>();
	                  
	      Place[] arr = {viewCourse.getPlace1(), viewCourse.getPlace2(), viewCourse.getPlace3() };
	      for (Place p : arr) {
	         if (p != null) {
	            Integer id = p.getPlaceId();
	            Company com = companyService.getCompanyByPlaceId(id);
	            
	            if (com != null) {
	            	if (com.getAccept() == 1) {
		               List<Coupon> cou = couponService.getCouponByCompanyId(com.getCompanyId());
		               for (Coupon c : cou) {
		            	   MemberCouponButton m = new MemberCouponButton(com.getPlace().getPlaceName(), c);
		            	   mcb.add(m);
		               }
	            	}
	            }
	         }
	      }      
	      List<Review> reviews = reviewService.findReviewByCourseId(courseId);
	      for(Review r : reviews) {
	    	  Member member = memberService.findMemberById(r.getMemberId());
	    	  r.setNickName(member.getNickName());
	      }
	      mav.addObject("reviews", reviews);
	      mav.addObject("couponList", mcb);
	      
	      boolean myCourseLike = false;
	      boolean myScrap = false;
	      if (courseLikeService.getCourseLikeByPrimaryKey(sessionMember.getId(), courseId) != null) { // ?????? ????????? ??? ???????????? ??????
	    	  myCourseLike = true;
	      }
	      if (scrapService.getScrapByPrimaryKey(sessionMember.getId(), courseId) != null) {
	    	  myScrap = true;
	      }
	      System.out.println("?????????,???????????????:"+myCourseLike+" "+myScrap);
	      
	      mav.addObject("myCourseLike", myCourseLike);
	      mav.addObject("myScrap", myScrap);
	      
		return mav;
	}

	@Getter @Setter @AllArgsConstructor @ToString
	public class Taste {
		private String code;
		private String label;
	}
	
	@ModelAttribute("tasteCodes") // return ????????? ????????? ???????????? view??? ??????
	protected List<Taste> referenceData2() throws Exception {
		List<Taste> tasteCodes = new ArrayList<>();
		tasteCodes.add(new Taste("act", "????????????"));
		tasteCodes.add(new Taste("hea", "????????????"));
		tasteCodes.add(new Taste("nat", "????????????"));
		tasteCodes.add(new Taste("exp", "????????????"));
		tasteCodes.add(new Taste("ent", "?????????"));
		tasteCodes.add(new Taste("ret", "?????????"));
		tasteCodes.add(new Taste("cal", "?????????"));
		return tasteCodes;	
	}
}
