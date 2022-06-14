package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.Place;
import com.example.demo.domain.SessionMember;
import com.example.demo.domain.TasteCategory;
import com.example.demo.service.SearchService;
import com.example.demo.service.TasteService;

@Controller
@SessionAttributes({"tList", "cList"})
public class SearchPlaceController {
	private static final String SEARCH_VIEW = "search";
	private static final String[] method = null;
//	private static final String RESULT_VIEW = "member/registered";
	
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
	
	@RequestMapping("/course/search/main")
	public String handleRequest(
			ModelMap model
			) throws Exception {
		List<TasteCategory> tList = tasteService.getCategory();
		model.put("tList", tList);
		return SEARCH_VIEW;
	}
	@RequestMapping("/course/search.do")
	public String handleRequest(
			@RequestParam("station") String station,
			ModelMap model
			) throws Exception {
		List<TasteCategory> tList = tasteService.getCategory();
		//String station = "seoul";
		PagedListHolder<Course> cList = new PagedListHolder<Course>(this.searchService.getCourseList(station));
		cList.setPageSize(4);
		model.put("tList", tList);
		model.put("cList", cList);
		return SEARCH_VIEW;
	}

	@RequestMapping("/course/search2.do")
	public String handleRequest2(
			@RequestParam("page") String page,
			@ModelAttribute("tList") List<TasteCategory> tList,
			@ModelAttribute("cList") PagedListHolder<Course> cList,
			BindingResult result) throws Exception {
		if (tList == null || cList == null) {
			throw new IllegalStateException("Cannot find pre-loaded category and product list");
		}
		if ("next".equals(page)) { cList.nextPage(); }
		else if ("previous".equals(page)) { cList.previousPage(); }
		return SEARCH_VIEW;
	}
	
	
	
	/*
	@ModelAttribute("tasteCate")
	public TasteCategory[] referencePerformerTypes() {
		return TasteCategory.values();
	}
	
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
	}*/
	/*
	@GetMapping
	public ModelAndView searchPlaceForm() throws Exception {
		List<TasteCategory> tList = tasteService.getCategory();

		ModelAndView mav = new ModelAndView(SEARCH_VIEW); // view 이름: "hello" 
		mav.addObject("tList", tList);
		return mav;
	}
	@PostMapping
	public ModelAndView submit(HttpServletRequest request,
			@RequestParam(value="keyword1", required=false) String keyword1,
			@RequestParam(value="keyword2", required=false) String keyword2,
			@PageableDefault(page = 0, size = 10, sort = "courseId") Pageable pageable,
			Model model) throws Exception {
		ModelAndView mav = new ModelAndView(SEARCH_VIEW); // view 이름: "hello"    

		double x = 37.577552;
		double y = 126.976869;
		mav.addObject("x", x);
		mav.addObject("y", y);
		String station = "시청역";
		mav.addObject("station", station);
		List<Course> cList = searchService.getCourseList(station);
		mav.addObject("cList", cList);
		
		List<TasteCategory> tList = tasteService.getCategory();
		mav.addObject("tList", tList);
		
	   return mav;   
	}*/
}
