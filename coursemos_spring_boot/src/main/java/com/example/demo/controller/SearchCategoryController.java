package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.TasteCategory;
import com.example.demo.service.SearchService;
import com.example.demo.service.TasteService;
@RestController
@RequestMapping("/course/detailedSearch")
public class SearchCategoryController {
	private static final String SEARCH_VIEW = "search";
	
	@Autowired
	private SearchService searchService;
	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}
	@Autowired
	private TasteService tasteService;
	public void setTasteService(TasteService tasteService) {
		this.tasteService = tasteService;
	}
	
	@PostMapping
	public ModelAndView submit() {
		
		ModelAndView mav = new ModelAndView(SEARCH_VIEW); // view 이름: "hello"    
		//List<Course> cList = searchService.getCourseList();
		//mav.addObject("cList", cList);
		double x = 37.577552;
		double y = 126.976869;
		mav.addObject("x", x);
		mav.addObject("y", y);
		String station = "시청역";
		mav.addObject("station", station);
		List<Course> cList = searchService.getCourseList(x, y, station);
		//Page<Course> cList = 
		mav.addObject("cList", cList);
		//List<String> tList = tasteService.getCategoryList();
		//mav.addObject("tList", tList);
		
	   return mav;   
	}
}
