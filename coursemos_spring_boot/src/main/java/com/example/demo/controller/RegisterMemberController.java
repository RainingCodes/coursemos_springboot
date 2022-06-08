package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.example.demo.validator.MemberValidator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Controller
@SessionAttributes("member")
@RequestMapping(value="/join")
public class RegisterMemberController {
	@Autowired
	private MemberService memberService;
	
	@ModelAttribute("member")
	public Member formBacking(HttpServletRequest request) {
		Member member = new Member(); // MemberInfo 객체 생성
		return member; // session에 “member” 이름으로 저장됨
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		return "member/join";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(@ModelAttribute Member member,
	BindingResult result, SessionStatus status, HttpServletRequest request) {
		new MemberValidator().validate(member, result);
		if (result.hasErrors()) {
			return "member/join";
		}
		memberService.insertMember(member);
		SessionMember sessionMember = new SessionMember(member.getId(), member.getNickName(), member.getPassword(), member.getPoints());
		status.setComplete(); // session 종료 (“member” 객체 참조가 삭제됨)
		HttpSession session = request.getSession();
		session.setAttribute("memberSession", sessionMember);
		return "index"; // “member” 객체가 view에 전달됨 (request를 통해) 
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
		tasteCodes.add(new Taste("act", "활동적"));
		tasteCodes.add(new Taste("hea", "힐링"));
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

