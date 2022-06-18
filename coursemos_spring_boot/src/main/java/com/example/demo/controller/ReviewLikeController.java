package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Review;
import com.example.demo.domain.ReviewLike;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.ReviewLikeService;
import com.example.demo.service.ReviewService;

@Controller
@SessionAttributes({"sessionMember", "review"})
public class ReviewLikeController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReviewLikeService reviewLikeService;
	
	@RequestMapping(value = "/review/like/{reviewId}")
	public  ModelAndView like(@ModelAttribute SessionMember sessionMember, @ModelAttribute Review review, HttpSession session,
			 @PathVariable("reviewId") Long id) {
		 ModelAndView mv = new ModelAndView("redirect:/review/view/" + id);
		review.setLikes(review.getLikes() + 1);
		reviewService.insertReview(review);
		System.out.println(sessionMember);
		System.out.println(id);
		reviewLikeService.save(new ReviewLike(id, sessionMember.getId()));
		mv.addObject(review);
		mv.addObject(sessionMember);
		return mv;
	}
	@RequestMapping(value = "/review/dislike/{reviewId}")
	public String dislike(@ModelAttribute SessionMember sessionMember, @ModelAttribute Review review, HttpSession session,
			@PathVariable("reviewId") Long id) {
		 ModelAndView mv = new ModelAndView("redirect:/review/registered/" + id);
		review.setLikes(review.getLikes() - 1);
		reviewService.insertReview(review);
		reviewLikeService.delete(new ReviewLike(id, sessionMember.getId()));
		mv.addObject(review);
		mv.addObject(sessionMember);
		return "redirect:/review/view/" + id;
	}
}
