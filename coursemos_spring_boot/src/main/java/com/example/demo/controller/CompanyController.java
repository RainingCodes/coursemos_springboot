package com.example.demo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Company;
import com.example.demo.service.CompanyService;


@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
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
	public String companyRegister(@ModelAttribute("Company") Company company, Model model) {
		
		//사업자등록번호는 무조건 10자리임(이거 나중에 세팅)
		//전화번호도 세팅
		
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    company.setRegisterDate(current);
	    company.setAccept(0);
	    company.setMemberId(7); // 세션 완성되면 설정하기
	    companyService.insertCompany(company);
		
		return "redirect:/company/list";
	}
	
	@RequestMapping("/company/list")
	public ModelAndView companyList() {
		ModelAndView mav = new ModelAndView("company/manageCompany");
		
		List<Company> list = companyService.getCompanyByMemberId(7); // 세션 완성되면 설정하기
		mav.addObject("companyList", list);
		
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
