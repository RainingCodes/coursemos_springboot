package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
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
import com.example.demo.domain.SessionMember;
import com.example.demo.service.MemberService;
import com.example.demo.validator.LoginValidator;



@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/login2")
public class LoginMemberController {
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		return "member/login2";
	}
	
	@ModelAttribute("sessionMember")
	public SessionMember formBacking(HttpServletRequest request) {
		SessionMember sessionMember = new SessionMember();	 // MemberInfo 객체 생성
		return sessionMember; // session에 “member” 이름으로 저장됨
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
					}
						
					else {
						sessionMember.setCheck1(true);
						sessionMember.setCheck2(true);
						sessionMember.setGenderCode(member.getGenderCode());
						sessionMember.setBirth(member.getBirth());
						sessionMember.setPoints(member.getPoints());
						sessionMember.setTasteCode(member.getTasteCode());
					}
				}
				new LoginValidator().validate(sessionMember, result);
				if (result.hasErrors()) {
					return "member/login2";
				}
				return "index"; // “member” 객체가 view에 전달됨 (request를 통해) 
			}
	
}