package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index"); 
		return mav;
	}
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login"); 
		return mav;
	}
	@RequestMapping("user/login")
	public ModelAndView login2() {
		ModelAndView mav = new ModelAndView("login2"); 
		return mav;
	}
	
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("join"); 
		return mav;
	}
	
	@RequestMapping("/mock")
	public ModelAndView mock() {
		ModelAndView mav = new ModelAndView("mock");
		return mav;
	}
	@RequestMapping("/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView("mypage");
		return mav;
	}
	@RequestMapping("/points")
	public ModelAndView points() {
		ModelAndView mav = new ModelAndView("points");
		return mav;
	}
}
