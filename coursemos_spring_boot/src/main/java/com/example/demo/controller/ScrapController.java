package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.MemberCoupon;
import com.example.demo.domain.Scrap;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CourseService;
import com.example.demo.service.ScrapService;

@Controller
@SessionAttributes("sessionMember")
public class ScrapController {
	@Autowired
	private ScrapService scrapService;
	@Autowired
	private CourseService courseService;
	
//	@RequestMapping("/course/scrap")
//	public String courseScrap(@ModelAttribute SessionMember sessionMember, 
//			@RequestParam("courseId") int courseId) {		
//		Scrap exist = scrapService.getScrapByPrimaryKey(sessionMember.getId(), courseId);
//		if (exist == null) {
//			scrapService.insertScrap(new Scrap(sessionMember.getId(), courseId));
//		} else {
//			scrapService.deleteScrap(exist);
//		}
//		
//		return "redirect:/course/view/"+courseId;
//	}
	
	
	@RequestMapping("/member/scrap/list")
	public ModelAndView scrapList(@ModelAttribute SessionMember sessionMember) {
		ModelAndView mav = new ModelAndView("member/scrapList");
		
		List<Scrap> list = scrapService.getScrapByMemberId(sessionMember.getId()); // 세션 완성되면 설정하기
		ArrayList<Course> courseList = new ArrayList<Course>();
		
		for (Scrap s : list) {
			Course c = courseService.getCourseByCourseId(s.getCourseId()); // 상의할거
			courseList.add(c);
		}
		mav.addObject("courseList", courseList);
		
		return mav;
	}
	
//	@RequestMapping("/user/unscrap")
//	public String deleteScrap(@ModelAttribute SessionMember sessionMember, 
//			@RequestParam("courseId") int courseId) {
//		Scrap scrap = scrapService.getScrapByPrimaryKey(sessionMember.getId(), courseId);
//		scrapService.deleteScrap(scrap);
//		
//		return "redirect:/member/scrap/list";
//	}
}
