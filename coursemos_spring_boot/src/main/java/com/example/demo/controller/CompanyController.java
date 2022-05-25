package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Company;



@Controller
public class CompanyController {
	
	@ModelAttribute("Company")
	public Company formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Company company = new Company();
			// 기본값은 나중에 설정
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
		//등록하면 userid값 받아서제휴 등록 리스트창으로
		//유저 세션유지 해야할듯???
		int userId = 0;
		
		return "company/list/"+userId;
	}
	
	@RequestMapping("/company/list/{userId}")
	public ModelAndView companyList(@PathVariable String userId) {
		ModelAndView mav = new ModelAndView("company/manageCompany");
		
		//userId 기준으로 회사 정보 받아와서 넣고 넘기기
		mav.addObject("greeting", "test");
		return mav;
	}
	
	@RequestMapping("/company/{userId}/{companyId}")
	public ModelAndView companyDetail() {	
		ModelAndView mav = new ModelAndView("company/detailComany");
		
		//companyId로 회사 상세정보 받아와서 넣고 넘기기
		mav.addObject("greeting", "test");
		return mav;
	}
}
