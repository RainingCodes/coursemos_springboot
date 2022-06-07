package com.example.demo.controller;


import org.springframework.stereotype.Controller;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Member;



@Controller
public class IndexController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index"); 
		return mav;
	}
	
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("member/login"); 
		return mav;
	}
	
	@RequestMapping("/member/login")
	public ModelAndView login2(@ModelAttribute("member") @Validated Member member) {
		ModelAndView mav = new ModelAndView("login2"); 
		
		return mav;
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
	public ModelAndView mypage(@RequestParam("memberId") String memberId) {
		ModelAndView mav = new ModelAndView("mypage");
		return mav;
	}
	@RequestMapping("/points")
	public ModelAndView points() {
		ModelAndView mav = new ModelAndView("points");
		return mav;
	}
	

}
