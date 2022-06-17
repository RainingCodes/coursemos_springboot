package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.CourseLike;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CourseLikeService;

@Controller
@SessionAttributes("sessionMember")
public class CourseLikeController {
	@Autowired
	private CourseLikeService courseLikeService;
	
	
	@RequestMapping("/course/like")
	public ModelAndView courseScrap(@ModelAttribute SessionMember sessionMember, 
			@RequestParam("courseId") int courseId) {
		ModelAndView mav = new ModelAndView("alert");
		CourseLike exist = courseLikeService.getCourseLikeByPrimaryKey(sessionMember.getId(), courseId);
		if (exist == null) {
			courseLikeService.insertScrap(new CourseLike(sessionMember.getId(), courseId));
			mav.addObject("msg", "코스에 좋아요를 눌렀습니다.");
		} else {
			courseLikeService.deleteScrap(exist);
			mav.addObject("msg", "좋아요가 취소되었습니다.");
		}		
		
		mav.addObject("url", "/course/view/"+courseId);
		
		return mav;
	}
}
