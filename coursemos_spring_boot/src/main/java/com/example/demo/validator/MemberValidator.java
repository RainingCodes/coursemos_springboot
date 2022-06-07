package com.example.demo.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.Member;

public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Member member = (Member) target;
		if(member.getNickName() == null || member.getNickName().trim().isEmpty())
				errors.rejectValue("nickName", "required");
		if(member.getPassword() == null || member.getPassword().trim().isEmpty())
			errors.rejectValue("password", "required");
		else if(!member.getPassword().matches("^[A-Za-z0-9]{6,12}$"))
			errors.rejectValue("password", "pattern");
		if(member.getGenderCode() == null)
			errors.rejectValue("genderCode", "required");
		
	}

}
