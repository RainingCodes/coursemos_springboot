package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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
	public ModelAndView submit(HttpServletRequest request,
			@RequestParam(value="taste", required=false) String taste) throws Exception {
			System.out.println(taste);
			ModelAndView mav = new ModelAndView(SEARCH_VIEW); // view 이름: "hello"  
			List<Course> cList = searchService.getCourseListByTaste(taste);
	//		List<Course> cList = searchService.getCourseListByTaste(taste.getName());
			mav.addObject("cList", cList);
			List<TasteCategory> tList = tasteService.getCategory();
			mav.addObject("tList", tList);
			
		   return mav;   
		
	}

}
