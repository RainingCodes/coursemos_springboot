package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Scrap;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.ScrapService;

@Controller
@SessionAttributes("sessionMember")
public class ScrapController {
	@Autowired
	private ScrapService scrapService;
	
	@RequestMapping("/course/scrap")
	public String courseScrap(@ModelAttribute SessionMember sessionMember, 
			@RequestParam("courseId") Long courseId) {		
		Scrap exist = scrapService.getScrapByPrimaryKey(sessionMember.getId(), courseId);
		if (exist == null) {
			scrapService.insertScrap(new Scrap(sessionMember.getId(), courseId));
		} else {
			scrapService.deleteScrap(exist);
		}
		
		return "redirect:/course/view/"+courseId;
	}
	
	@RequestMapping("/member/scrap/list")
	public ModelAndView scrapList(@ModelAttribute SessionMember sessionMember) {
		ModelAndView mav = new ModelAndView("company/manageCompany");
		
		List<Scrap> list = scrapService.getScrapByMemberId(sessionMember.getId()); // 세션 완성되면 설정하기
		mav.addObject("scrapList", list);
		
		return mav;
	}
	
	@RequestMapping("/user/unscrap")
	public String deleteScrap(@ModelAttribute SessionMember sessionMember, 
			@RequestParam("courseId") Long courseId) {
		Scrap scrap = scrapService.getScrapByPrimaryKey(sessionMember.getId(), courseId);
		scrapService.deleteScrap(scrap);
		
		return "redirect:/member/scrap/list";
	}
}
