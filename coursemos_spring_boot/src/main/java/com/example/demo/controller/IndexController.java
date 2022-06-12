package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.SessionMember;

@Controller
@SessionAttributes("sessionMember")
public class IndexController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index"); 
		return mav;
	}
	
	@ModelAttribute("sessionMember")
	public SessionMember formBacking(HttpServletRequest request) {
		SessionMember sessionMember = new SessionMember();	 // MemberInfo 객체 생성
		return sessionMember; // session에 “member” 이름으로 저장됨
	}
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("member/login"); 
		return mav;
	}
	@RequestMapping("/member/logout")
	public String logout(@ModelAttribute SessionMember sessionMember,
			BindingResult result, SessionStatus status) {
		sessionMember.setNickName(null);
		sessionMember.setPassword(null);
		sessionMember.setGenderCode(null);
		sessionMember.setPoints(0);
		sessionMember.setTasteCode(null);
		sessionMember.setCheck1(false);
		sessionMember.setCheck2(false);
		return "index";
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		return "member/join";
	}
	
	@RequestMapping("/mock")
	public ModelAndView mock() {
		ModelAndView mav = new ModelAndView("mock");
		return mav;
	}
	@RequestMapping("/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView("member/mypage");
		return mav;
	}
	@RequestMapping("/points")
	public ModelAndView points() {
		ModelAndView mav = new ModelAndView("points");
		return mav;
	}
	

}


