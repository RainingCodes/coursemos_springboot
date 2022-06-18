package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.domain.Course;
import com.example.demo.domain.Review;
import com.example.demo.domain.ReviewLike;
import com.example.demo.domain.ReviewReadableMember;
import com.example.demo.service.CourseService;
import com.example.demo.service.ReviewLikeService;
import com.example.demo.service.ReviewReadableMemberService;
import com.example.demo.service.ReviewService;

@Controller
public class DeleteCourseController {
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReviewLikeService reviewLikeService;
	
	@Autowired
	private ReviewReadableMemberService reviewReadableMemberService;
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String deleteCourse(@ModelAttribute Course course, BindingResult result, SessionStatus status, HttpServletRequest request) {
		Review review = reviewService.findReviewById(Long.valueOf(course.getCourseId()));
		List<ReviewLike> rll = reviewLikeService.findReviewLikeByReviewId(Long.valueOf(course.getCourseId()));
		if(rll != null) {
			for(ReviewLike rl : rll) {
				reviewLikeService.delete(rl);
			}
		}
		List<ReviewReadableMember> rrml= reviewReadableMemberService.findReviewReadableMemberByReviewId(Long.valueOf(course.getCourseId()));
		if(rrml != null) {
			for(ReviewReadableMember rrm : rrml) {
				reviewReadableMemberService.delete(rrm);
			}
		}
		reviewService.delete(review);
		
		courseService.deleteCourse(course);
		System.out.println(course.getCourseId() + " : delete complete!!!");
		
		

		return "index";
	}
}
