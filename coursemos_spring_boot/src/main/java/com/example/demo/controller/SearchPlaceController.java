package com.example.demo.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.controller.CompanyController.Taste;
import com.example.demo.domain.Course;
import com.example.demo.domain.Place;
import com.example.demo.domain.SessionMember;
import com.example.demo.domain.TasteCategory;
import com.example.demo.repository.CourseRepository;
import com.example.demo.repository.SearchRepository;
import com.example.demo.service.CourseService;
import com.example.demo.service.SearchService;
import com.example.demo.service.TasteService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
//@SessionAttributes({"tList", "cList"})
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
	private CourseService courseService;
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	
	@Autowired
	private TasteService tasteService;
	public void setTasteService(TasteService tasteService) {
		this.tasteService = tasteService;
	}
	
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
	public String handleRequestTest(
			@RequestParam("subway") String subway,
			@RequestParam("x") double x,
			@RequestParam("y") double y,
			ModelMap model,
			@PageableDefault(size = 3, sort = "courseId",  direction = Sort.Direction.DESC) Pageable pageable
			) throws Exception {
		List<Taste> tList = referenceData();
		model.put("tList", tList);
		Sort sort = Sort.by("courseId").descending();
		Page<Course> cList = courseService.findByPlace1_Subway(subway, pageable);
		model.put("cList", cList);
		model.put("subway", subway);
		model.put("x", x);
		model.put("y", y);
		
		return SEARCH_VIEW;
	}
	/*
	@RequestMapping("/course/search.do")
	public String handleRequest(
			@RequestParam("subway") String subway,
			@RequestParam("x") double x,
			@RequestParam("y") double y,
			ModelMap model
			) throws Exception {
		List<Taste> tList = referenceData();
		//String station = "seoul";
		PagedListHolder<Course> cList = new PagedListHolder<Course>(this.searchService.getCourseList(subway));
		cList.setPageSize(4);
		model.put("subway", subway);
		model.put("x", x);
		model.put("y", y);
		model.put("tList", tList);
		Sort sort = Sort.by("courseId").descending();
		//Pageable pageReq = PageRequest.of(4, 5, sort);
		//Page<Course> cList = courseService.findAll(pageable);
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
	
	*/
	
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
