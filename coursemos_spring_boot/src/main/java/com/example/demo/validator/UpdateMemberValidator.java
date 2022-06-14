package com.example.demo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.SessionMember;

public class UpdateMemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return SessionMember.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		SessionMember member = (SessionMember) target;
		if(member.getNickName() == null || member.getNickName().trim().isEmpty())
			errors.rejectValue("nickName", "required");
	}

}
