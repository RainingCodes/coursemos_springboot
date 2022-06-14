package com.example.demo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.SessionMember;

public class UpdatePwValidatior implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return SessionMember.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		SessionMember member = (SessionMember) target;
		if(member.isCheck1() == false)
			errors.rejectValue("password", "error");
		if(member.getPassword() == null || member.getPassword().trim().isEmpty())
			errors.rejectValue("password", "required");
		else if(!member.getPassword().matches("^[A-Za-z0-9]{6,12}$"))
			errors.rejectValue("password", "pattern");
		if(!member.getPassword().equals(member.getRepw()))
			errors.rejectValue("repw", "wrong");
	}

}
