package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
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

import com.example.demo.dao.CourseDao;
import com.example.demo.domain.Course;
import com.example.demo.domain.CourseList;
import com.example.demo.domain.TasteCategory;
import com.example.demo.service.SearchService;
import com.example.demo.service.TasteService;
@Controller
public class SearchCategoryController {
	private static final String SEARCH_DETAIL_VIEW = "detailSearch";
	private SearchService searchSercive;

	@Autowired
	public void setSerachService(SearchService searchSercive) {
		this.searchSercive = searchSercive;
	}
	
	@Autowired
	private TasteService tasteService;
	public void setTasteService(TasteService tasteService) {
		this.tasteService = tasteService;
	}
	/*
	@PostMapping
	public ModelAndView submit(HttpServletRequest request,
			@RequestParam(value="station", required=false) String station,
			@RequestParam(value="taste", required=false) String taste,
			@RequestParam(value="page", required=false) String page,
			@ModelAttribute("sessionCourse") CourseDao course) throws Exception {
			System.out.println(taste);
			ModelAndView mav = new ModelAndView(SEARCH_VIEW); // view 이름: "hello"  
			//List<Course> cList = searchService.getCourseListByTaste(taste);
			//mav.addObject("cList", cList);
			List<TasteCategory> tList = tasteService.getCategory();
			mav.addObject("tList", tList);
			handleRequest(page, course, station);
		   return mav;   
		
	}*/
	
	@RequestMapping("/course/detailedSearch")
	public String viewCart(
			HttpServletRequest request,
			@RequestParam("page") String page,
			@ModelAttribute("category") TasteCategory category,
			@ModelAttribute("courseList") PagedListHolder<Course> courseList,
			BindingResult result) throws Exception {
		if ("next".equals(page)) { courseList.nextPage(); }
		else if ("previous".equals(page)) { courseList.previousPage(); }
		return SEARCH_DETAIL_VIEW;
	}
	
	

}
