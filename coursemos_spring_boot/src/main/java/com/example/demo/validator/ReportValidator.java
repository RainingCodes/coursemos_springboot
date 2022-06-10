package com.example.demo.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.Report;

public class ReportValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Report.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Report report = (Report) target;
		if(report.getReportCategory() == null)
			errors.rejectValue("reportCategory", "required");
		
	}

}
