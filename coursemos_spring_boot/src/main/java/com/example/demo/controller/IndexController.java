package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Member;
import com.example.demo.domain.Report;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

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
	@ModelAttribute("member")
	public Member formBacking(HttpServletRequest request) {
		return new Member();
	}
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("member/join"); 
		return mav;
	}

	
	@RequestMapping("/member/register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView("/"); 
		return mav;
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
	
	@ModelAttribute("genderCodes") // return 객체에 이름을 부여하고 view에 전달
	protected List<Gender> referenceData1() throws Exception {
		List<Gender> genderCodes = new ArrayList<>();
		genderCodes.add(new Gender(0, "여자"));
		genderCodes.add(new Gender(1, "남자"));
		genderCodes.add(new Gender(2, "기타"));
		return genderCodes;	
	}
	@ModelAttribute("tasteCodes") // return 객체에 이름을 부여하고 view에 전달
	protected List<Taste> referenceData2() throws Exception {
		List<Taste> tasteCodes = new ArrayList<>();
		tasteCodes.add(new Taste("act", "활동적인"));
		tasteCodes.add(new Taste("hea", "힐링"));
		tasteCodes.add(new Taste("nat", "자연적인"));
		tasteCodes.add(new Taste("exp", "체험적인"));
		tasteCodes.add(new Taste("ent", "즐거운"));
		tasteCodes.add(new Taste("ret", "복고풍"));
		tasteCodes.add(new Taste("cal", "잔잔한"));
		return tasteCodes;	
	}
	@Getter @Setter @AllArgsConstructor
	public class Gender {
		private int code;
		private String label;
	}
	@Getter @Setter @AllArgsConstructor
	public class Taste {
		private String code;
		private String label;
	}
}
