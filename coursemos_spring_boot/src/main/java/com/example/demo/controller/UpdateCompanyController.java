package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.controller.CompanyController.Taste;
import com.example.demo.domain.Company;
import com.example.demo.service.CompanyService;
import com.example.demo.validator.CompanyValidator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
public class UpdateCompanyController {
	@Autowired
	private CompanyService companyService;
	
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
	
	@ModelAttribute("Company")
	public Company formBacking(@RequestParam("id") Long id, HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Company company = companyService.getCompanyByCompanyId(id);
			return company;
		}
		else return new Company();
	}
	
	@RequestMapping(value = "/company/update", method = RequestMethod.GET)
	public String companyForm(@RequestParam("id") Long id) {
		return "company/updateCompany";
	}
	
	@RequestMapping(value = "/company/update", method = RequestMethod.POST)
	public String companyRegister(@Valid @ModelAttribute("Company") Company company, BindingResult result) {
		new CompanyValidator().validate(company, result);
		if (result.hasErrors()) {
			return "company/updateCompany";
		}
		
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    company.setRegisterDate(current);
	    //company.setAccept(0);
	    //company.setMemberId(1); // 세션 완성되면 설정하기
	    
	    companyService.updateCompany(company);
		
		return "redirect:/company/list";
	}
}
