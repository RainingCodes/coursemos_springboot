package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Course;
import com.example.demo.service.CourseService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
public class SearchPlaceController {
	private static final String SEARCH_VIEW = "search";
	
	@Autowired
	private CourseService courseService;
	
	@Getter @Setter @AllArgsConstructor @ToString
	public class Taste {
		private String code;
		private String label;
	}
	@ModelAttribute("tasteCodes") // return 객체에 이름을 부여하고 view에 전달
	protected List<Taste> referenceData() throws Exception {
		ArrayList<Taste> tasteCodes = new ArrayList<>();
		tasteCodes.add(new Taste("act", "활동적인"));
		tasteCodes.add(new Taste("hea", "힐링되는"));
		tasteCodes.add(new Taste("nat", "자연적인"));
		tasteCodes.add(new Taste("exp", "체험적인"));
		tasteCodes.add(new Taste("ent", "즐거운"));
		tasteCodes.add(new Taste("ret", "복고풍"));
		tasteCodes.add(new Taste("cal", "잔잔한"));
		return tasteCodes;	
	}
	
	@RequestMapping("/course/search/main")
	public String handleRequest(
			ModelMap model
			) throws Exception {
		List<Taste> tList = referenceData();
		model.put("tList", tList);
		
		return SEARCH_VIEW;
	}
	
	@RequestMapping("/course/search.do")
	public String handleRequest(
			@RequestParam("subway") String subway,
			@RequestParam("x") double x,
			@RequestParam("y") double y,
			ModelMap model
			,@PageableDefault(size = 3, sort = "courseId",  direction = Sort.Direction.ASC) Pageable pageable
			) throws Exception {
		List<Taste> tList = referenceData();
		model.put("tList", tList);
		
		Page<Course> cList = courseService.findByPlace1Subway(subway, pageable);
		model.put("cList", cList);
		model.put("subway", subway);
		model.put("x", x);
		model.put("y", y);
		
		return "search_result";
	}
}
