package com.example.demo.controller;

import java.util.ArrayList;
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
import com.example.demo.domain.Place;
import com.example.demo.service.CompanyService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@Getter @Setter @AllArgsConstructor @NoArgsConstructor
	public class CompanyAndPlace {
		Company company;
		Place place;
	}
	
	@Getter @Setter @AllArgsConstructor @ToString
	public class Taste {
		private String code;
		private String label;
	}
	
	@ModelAttribute("tasteCodes") // return 객체에 이름을 부여하고 view에 전달
	protected List<Taste> referenceData() throws Exception {
		List<Taste> tasteCodes = new ArrayList<>();
		tasteCodes.add(new Taste("act", "활동적인　"));
		tasteCodes.add(new Taste("hea", "힐링되는　"));
		tasteCodes.add(new Taste("nat", "자연적인　"));
		tasteCodes.add(new Taste("exp", "체험적인　"));
		tasteCodes.add(new Taste("ent", "즐거운　"));
		tasteCodes.add(new Taste("ret", "복고풍　"));
		tasteCodes.add(new Taste("cal", "잔잔한　"));
		return tasteCodes;	
	}
	
	@ModelAttribute("RegisterForm")
	public CompanyAndPlace formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			CompanyAndPlace RegisterForm = new CompanyAndPlace();
			return RegisterForm;
		}
		else return new CompanyAndPlace();
	}
	
	@RequestMapping(value = "/company/register", method = RequestMethod.GET)
	public String companyForm(Model model) {
		return "company/addCompany";
	}
	
	@RequestMapping(value = "/company/register", method = RequestMethod.POST)
	public String companyRegister(@ModelAttribute("RegisterForm") CompanyAndPlace RegisterForm, Model model) {
		
		//사업자등록번호는 무조건 10자리임(이거 나중에 세팅)
		//전화번호도 세팅
		
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    
	    RegisterForm.company.setRegisterDate(current);
	    RegisterForm.company.setAccept(0);
	    RegisterForm.company.setMemberId(7); // 세션 완성되면 설정하기
	    
	    //companyService.insertCompany(company);
		
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
	public ModelAndView companyDetail(@RequestParam("companyId") int companyId) {	
		ModelAndView mav = new ModelAndView("company/detailCompany");
		
		//companyId로 회사 상세정보 받아와서 넣고 넘기기
		Company company = companyService.getCompanyByCompanyId(companyId);  // 세션 완성되면 설정하기
		mav.addObject("nickname", "test");
		mav.addObject("company", company);
		return mav;
	}
	
	@RequestMapping("/company/list/detail/stop")
	public String companyStopConnect(@RequestParam("companyId") int companyId) {	
		Company company = companyService.getCompanyByCompanyId(companyId);
		company.setAccept(3);
		companyService.updateCompany(company);
		
		return "redirect:/company/list";
	}
	
	@RequestMapping("/company/list/detail/delete")
	public String companydeleteConnect(@RequestParam("companyId") int companyId) {
		
		Company company = companyService.getCompanyByCompanyId(companyId);
		companyService.deleteCompany(company);
		
		return "redirect:/company/list";
	}
	
	
}
