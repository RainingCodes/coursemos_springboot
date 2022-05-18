package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TesttController {
	@RequestMapping("/test.do")
	public String index(Model model) {
		model.addAttribute("greeting","greeting");
		return "test";
	}
}
