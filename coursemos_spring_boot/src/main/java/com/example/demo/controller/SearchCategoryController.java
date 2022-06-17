package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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

import com.example.demo.controller.SearchPlaceController.Taste;
import com.example.demo.dao.CourseDao;
import com.example.demo.domain.Course;
import com.example.demo.domain.CourseList;
import com.example.demo.domain.TasteCategory;
import com.example.demo.service.CourseService;
import com.example.demo.service.SearchService;
import com.example.demo.service.TasteService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Controller
//@SessionAttributes({"tList", "cList"})
public class SearchCategoryController {
	private static final String SEARCH_DETAIL_VIEW = "detailSearch";
	private SearchService searchService;

	@Autowired
	public void setSerachService(SearchService searchService) {
		this.searchService = searchService;
	}
	
	@Autowired
	private TasteService tasteService;
	public void setTasteService(TasteService tasteService) {
		this.tasteService = tasteService;
	}
	
	@Autowired
	private CourseService courseService;
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
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
	
	@RequestMapping("/course/detailedSearch.do")
	public String handleRequest(
			@RequestParam("subway") String subway,
			@RequestParam("taste") String taste,
			ModelMap model,
			@PageableDefault(size = 3, sort = "courseId",  direction = Sort.Direction.DESC) Pageable pageable
			) throws Exception {
		List<Taste> tList = referenceData();
		//PagedListHolder<Course> cList;
		Page<Course> cList = null;
		if (subway == "") {
			cList = courseService.findCourse1(taste, pageable);
		} else {
			cList = courseService.findCourse2(subway, taste, pageable);
		}
		model.put("subway", subway);
		model.put("tList", tList);
		model.put("cList", cList);
		return SEARCH_DETAIL_VIEW;
	}
/*
	@RequestMapping("/course/detailedSearch2.do")
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
		return SEARCH_DETAIL_VIEW;
	}
	*/
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
	/*
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
	}*/
	
	

}
