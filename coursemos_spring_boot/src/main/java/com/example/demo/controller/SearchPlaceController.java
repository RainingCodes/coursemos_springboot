package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.TasteCategory;
import com.example.demo.service.SearchService;



@RestController
@RequestMapping("/course/search")
public class SearchPlaceController {
	private static final String SEARCH_VIEW = "search";
	private static final String[] method = null;
//	private static final String RESULT_VIEW = "member/registered";
	
	@Autowired
	private SearchService searchService;
	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}
//	
//	@ModelAttribute("tasteCate")
//	public TasteCategory[] referencePerformerTypes() {
//		return TasteCategory.values();
//	}
	
	@ModelAttribute("tasteCate")
	protected List<TasteCategory> tasteList() throws Exception {
		List<TasteCategory> tList = new ArrayList<TasteCategory>();
		tList.add(new TasteCategory("active"));
		tList.add(new TasteCategory("calm"));
		tList.add(new TasteCategory("healing"));
		tList.add(new TasteCategory("nature"));
		tList.add(new TasteCategory("official"));
		tList.add(new TasteCategory("experience"));
		tList.add(new TasteCategory("entertain"));
		tList.add(new TasteCategory("retro"));
		return tList;
	}
	
	@ModelAttribute("courseList")
	public Course formBacking() {
		Course course = new Course();
		return course;
	}   
	
//	@RequestMapping(method=RequestMethod.GET)
//	public @ResponseBody String form() {
//		return SEARCH_VIEW;
//	}
	
	@GetMapping
	public ModelAndView searchPlaceForm() throws Exception {
		List<String> tList = searchService.getTasteCategory(null);

		ModelAndView mav = new ModelAndView(SEARCH_VIEW); // view 이름: "hello" 
		mav.addObject("tList", tList);
		return mav;
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
		List<String> tList = searchService.getTasteCategory(null);
		mav.addObject("tList", tList);
		
	   return mav;   
	}
}
