package com.example.demo.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.domain.Member;
import com.example.demo.domain.Points;
import com.example.demo.domain.Review;
import com.example.demo.domain.ReviewLike;
import com.example.demo.domain.ReviewReadableMember;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.MemberService;
import com.example.demo.service.PointsService;
import com.example.demo.service.ReviewReadableMemberService;
import com.example.demo.service.ReviewService;

@Controller
@SessionAttributes({"sessionMember", "review"})
public class ReviewReadableMemberController {
	@Autowired
	private ReviewReadableMemberService reviewReadableMemberService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private PointsService pointsService;
	@Autowired
	private MemberService memberService;
	@RequestMapping(value = "/review/{reviewId}/check", method = RequestMethod.GET)
	public  ModelAndView check(HttpSession session, @ModelAttribute SessionMember sessionMember, @PathVariable("reviewId") Long id) {
		ModelAndView mv;
		boolean c = reviewReadableMemberService.findReviewReadableMemberByMemberIdReviewId(sessionMember.getId(), id);
		if(c) {
			mv = new ModelAndView("redirect:/review/view/" + id);
		} else {
			mv = new ModelAndView("thyme/review/check");
		}
		System.out.println(sessionMember);
		session.setAttribute("sessionMember", sessionMember);
		return mv;
	}
	@RequestMapping(value = "/review/{reviewId}/check", method = RequestMethod.POST)
	public  String check2(HttpSession session, @ModelAttribute SessionMember sessionMember, RedirectAttributes rttr,
			 @PathVariable("reviewId") Long id) {
		Review review = reviewService.findReviewById(id);
		
		if(sessionMember.getPoints() < 5) {
			rttr.addAttribute("message", "f");
			return "redirect:/review/" + id + "/check";
		}
		java.util.Date date = new java.util.Date();
		long timeInMilliSeconds = date.getTime();
		Points points = new Points();
		points.setMemberId(sessionMember.getId());
		points.setPointsDate(new Date(timeInMilliSeconds));
		points.setType(3);
		points.setPoints(5);
		Member member= memberService.findMemberById(sessionMember.getId());
		member.insertPoints(points);
		member.setPoints(member.getPoints() - 5);
		pointsService.insertPoints(points);
		List<Points> pointList = pointsService.findAllByMemberId(sessionMember.getId());
		
		
		sessionMember.setPoints(sessionMember.getPoints() - 5);
		sessionMember.setPointList(pointList);
		
		memberService.save(member); 
		reviewReadableMemberService.save(new ReviewReadableMember(sessionMember.getId(), id));
		
		session.setAttribute("sessionMember", sessionMember);
		session.setAttribute("review", review);
		return "redirect:/review/view/" + id;
	}
}
