package com.example.demo.controller;


import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.domain.Member;
import com.example.demo.domain.Points;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.MemberService;
import com.example.demo.service.PointsService;
import com.example.demo.validator.LoginValidator;



@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/login2")
public class LoginMemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private PointsService pointsService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		return "member/login2";
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public String login(@Valid @ModelAttribute SessionMember sessionMember,
			BindingResult result, SessionStatus status) {
				
				Member member = memberService.findMemberByNickName2(sessionMember.getNickName());
				
				if(sessionMember.getNickName() != null && sessionMember.getPassword() != null) {
					if(member == null)
						sessionMember.setCheck1(false);
					else if(!member.getPassword().equals(sessionMember.getPassword())) {
						sessionMember.setCheck1(true);
						sessionMember.setCheck2(false);
					} else {
						sessionMember.setCheck1(true);
						sessionMember.setCheck2(true);
						sessionMember.setGenderCode(member.getGenderCode());
						sessionMember.setBirth(member.getBirth());
						List<Points> points = pointsService.findAllByMemberId(member.getId());
						sessionMember.setPoints(member.getPoints());
						sessionMember.setTasteCode(member.getTasteCode());
						sessionMember.setPointList(points);
					}
				}
				new LoginValidator().validate(sessionMember, result);
				
				if (result.hasErrors()) {
					return "member/login2";
				}
				sessionMember.setId(member.getId());
				return "index"; // “member” 객체가 view에 전달됨 (request를 통해) 
			}
	
}