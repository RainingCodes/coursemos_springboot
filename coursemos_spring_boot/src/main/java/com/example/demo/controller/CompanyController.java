package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Company;


@Controller
public class CompanyController {
	
	@ModelAttribute("Company")
	public Company formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Company company = new Company();
			
			return company;
		}
		else return new Company();
	}
	
	@RequestMapping(value = "/company/register", method = RequestMethod.GET)
	public String companyForm(Model model) {
		return "company/addCompany";
	}
	
	@RequestMapping(value = "/company/register", method = RequestMethod.POST)
	public String companyRegister(Model model) {
		
		//DB 등록
		//등록하면 제휴 등록 리스트창으로
		//유저 세션유지 해야할듯???
		
		return "/company/list";
	}
	
	@RequestMapping("/company/list")
	public ModelAndView companyList() {
		ModelAndView mav = new ModelAndView("company/manageCompany");
		
		//userId 기준으로 회사 정보 받아와서 넣고 넘기기
		mav.addObject("companyList", "test");
		
		return mav;
	}
	
	@RequestMapping("/company/list/detail")
	public ModelAndView companyDetail(@RequestParam("companyId") String companyId) {	
		ModelAndView mav = new ModelAndView("company/detailCompany");
		
		//companyId로 회사 상세정보 받아와서 넣고 넘기기
		mav.addObject("company", "test");
		return mav;
	}
	
	@RequestMapping("/company/list/detail/stop")
	public String companyStopConnect(@RequestParam("companyId") String companyId) {	
		
		//db 연동해서 값 바꾸고 리턴
		
		return "/company/list/detail";
	}
	
	
}
