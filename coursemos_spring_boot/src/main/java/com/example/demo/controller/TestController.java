package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@RequestMapping("/test")
	public ModelAndView index() {
		String message="대체 언제 됨?";
		ModelAndView mav = new ModelAndView("test"); // view 이름: "hello" 
		mav.addObject("greeting", message); // model 객체 이름: "greeting"
		return mav;
	}
}
