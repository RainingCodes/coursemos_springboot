package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.domain.SessionMember;



@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/login2")
public class LoginMemberController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		return "member/login2";
	}
	@ModelAttribute("sessionMember")
	public SessionMember formBacking(HttpServletRequest request) {
		SessionMember sessionMember = new SessionMember(); // MemberInfo 객체 생성
		return sessionMember; // session에 “member” 이름으로 저장됨
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(@ModelAttribute SessionMember member,
			BindingResult result, SessionStatus status) {
				if (result.hasErrors()) {
					return "member/login2";
				}
				System.out.println(member);
				status.setComplete();
				return "index"; // “member” 객체가 view에 전달됨 (request를 통해) 
			}
}
