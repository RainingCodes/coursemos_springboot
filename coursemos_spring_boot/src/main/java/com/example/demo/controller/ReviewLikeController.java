package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.domain.Review;
import com.example.demo.domain.ReviewLike;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.ReviewLikeService;

@Controller
@SessionAttributes({"sessionMember", "review"})
public class ReviewLikeController {
	@Autowired
	private ReviewLikeService reviewLikeService;
	
	@RequestMapping(value = "/review/like")
	public String like(@ModelAttribute SessionMember sessionMember, @ModelAttribute Review review, HttpSession session,
			Model model) {
		reviewLikeService.save(new ReviewLike(sessionMember.getId(), review.getReviewId()));
		return "redirect:thyme/review/registered";
	}
	@RequestMapping(value = "/review/unlike")
	public String unlike(@ModelAttribute SessionMember sessionMember, @ModelAttribute Review review, HttpSession session,
			Model model) {
		reviewLikeService.delete(new ReviewLike(sessionMember.getId(), review.getReviewId()));
		return "redirect:thyme/review/registered";
	}
}
