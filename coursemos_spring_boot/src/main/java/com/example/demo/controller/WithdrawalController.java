package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Member;
import com.example.demo.domain.Points;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.MemberService;
import com.example.demo.service.PointsService;
import java.util.List;


@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/member/withdrawal")
public class WithdrawalController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private PointsService pointsService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String request(@ModelAttribute SessionMember sessionMember, SessionStatus status) {
		Member member = memberService.findMemberById(sessionMember.getId());
		List<Points> points = pointsService.findAllByMemberId(member.getId());
		
		sessionMember = new SessionMember();
		
		for(Points p : points) {
			pointsService.delete(p);
		}
		memberService.delete(member);
		status.setComplete();

		return "forward:/";
	}
}
