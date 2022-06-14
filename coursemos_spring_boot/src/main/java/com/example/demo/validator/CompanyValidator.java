package com.example.demo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.Company;

public class CompanyValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Company.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Company company = (Company) target;
		Long companyId;
		try{
			companyId = company.getCompanyId();
			
			if (!(1000000000 <= companyId && companyId <= 9999999999L)) {
				errors.rejectValue("companyId", "Range");
			}
		} catch(NullPointerException e) {
			errors.rejectValue("companyId", "required");
		}		
		
	}

}
