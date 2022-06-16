package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Scrap;
import com.example.demo.service.ScrapService;

@Controller
public class ScrapController {
	@Autowired
	private ScrapService scrapService;
	
	@RequestMapping("/course/scrap")
	public String courseScrap(@RequestParam("courseId") Long courseId) {
		Long memberId = 1L; // 세션 처리 나중에
		Scrap scrap = new Scrap(memberId, courseId);
		
		if (scrapService.getScrapByPrimaryKey(scrap.getMemberId(), scrap.getCourseId()) == null) {
				scrapService.insertScrap(scrap);
		} else {
			scrapService.deleteScrap(scrap);
		}
		
		return "redirect:/course/view/"+courseId;
	}
}
