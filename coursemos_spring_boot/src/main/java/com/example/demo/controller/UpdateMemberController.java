package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.example.demo.domain.Member;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.MemberService;

import com.example.demo.validator.UpdateMemberValidator;
import com.example.demo.validator.UpdatePwValidatior;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
@SessionAttributes("sessionMember")
@RequestMapping("/member/update")
public class UpdateMemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String form(@ModelAttribute SessionMember sessionMember) {
		return "member/UpdateMypage";
	}
	@RequestMapping(value="/check0", method=RequestMethod.GET)
	public ModelAndView check0() {
		ModelAndView mav = new ModelAndView("member/CheckPassword"); 
		return mav;
	}
	
	
	
	@RequestMapping(value="/check0", method=RequestMethod.POST, params="passwordCheck")
	public String check0(@RequestParam String passwordCheck, @ModelAttribute SessionMember sessionMember, RedirectAttributes rttr) {
		String message ="t";
		if(!sessionMember.getPassword().equals(passwordCheck)) {
			message = "f";
		}
		rttr.addAttribute("message", message);
		return "redirect:check0";
	}
	
	@RequestMapping(value="/check", method=RequestMethod.GET)
	public ModelAndView check() {
		ModelAndView mav = new ModelAndView("member/check"); 
		return mav;
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST, params="nickName")
	public String check2(String nickName, RedirectAttributes rttr) {
		String message ="t";
	    
		if(memberService.findMemberByNickName(nickName) != false) {
			message = "f";
		}
		rttr.addAttribute("message", message);
		return "redirect:check";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String update(@Valid @ModelAttribute SessionMember sessionMember,
			BindingResult result, SessionStatus status) {
				
				Member member1 = memberService.findMemberById(sessionMember.getId());
				Member member2 = memberService.findMemberByNickName2(sessionMember.getNickName());
				if(sessionMember.getNickName() != null && sessionMember.getPassword() != null) {
					if(member2 == null) {
						member1.setNickName(sessionMember.getNickName());
						
					}
					if(sessionMember.getGenderCode() != member1.getGenderCode())
						member1.setGenderCode(sessionMember.getGenderCode());
					if(sessionMember.getTasteCode() != member1.getTasteCode())
						member1.setTasteCode(sessionMember.getTasteCode());
				}
				
				new UpdateMemberValidator().validate(sessionMember, result);
				if (result.hasErrors()) {
					
					return "member/UpdateMypage";
				}
				memberService.save(member1);
				return "member/mypage"; // “member” 객체가 view에 전달됨 (request를 통해) 
			}
	
	@RequestMapping(value="/password", method=RequestMethod.POST, params={"passwordCheck", "repw"})
	public String check2(@RequestParam String passwordCheck, @RequestParam String repw, @ModelAttribute SessionMember sessionMember, BindingResult result, RedirectAttributes rttr) {
		String originalPw = sessionMember.getPassword();
		if(originalPw.equals(passwordCheck)) {
			sessionMember.setCheck1(false);
		} else {
			sessionMember.setCheck1(true);
		}
		sessionMember.setPassword(passwordCheck);
		sessionMember.setRepw(repw);
		new UpdatePwValidatior().validate(sessionMember, result);
		if (result.hasErrors()) {
			sessionMember.setPassword(originalPw);
			return "member/ChangePassword";
		}
		Member member1 = memberService.findMemberById(sessionMember.getId());
		member1.setPassword(passwordCheck);
		memberService.save(member1);
		String message ="t";
		rttr.addAttribute("message", message);
		return "redirect:password";
	}
	
	@RequestMapping(value="/password", method=RequestMethod.GET)
	public ModelAndView check2() {
		ModelAndView mav = new ModelAndView("member/ChangePassword"); 
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
		tasteCodes.add(new Taste("hea", "힐링되는"));
		tasteCodes.add(new Taste("nat", "자연적인"));
		tasteCodes.add(new Taste("exp", "체험적인"));
		tasteCodes.add(new Taste("ent", "즐거운"));
		tasteCodes.add(new Taste("ret", "복고풍"));
		tasteCodes.add(new Taste("cal", "잔잔한"));
		return tasteCodes;	
	}
	
	@Getter @Setter @AllArgsConstructor @ToString
	public class Gender {
		private int code;
		private String label;
	}
	@Getter @Setter @AllArgsConstructor @ToString
	public class Taste {
		private String code;
		private String label;
	}
}
