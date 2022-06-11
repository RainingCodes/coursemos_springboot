package com.example.demo.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


import com.example.demo.domain.SessionMember;

public class LoginValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return SessionMember.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		
		SessionMember member = (SessionMember) target;
		System.out.println(member.getNickName().trim().isEmpty());
		if(member.getNickName() == null || member.getNickName().trim().isEmpty())
			errors.rejectValue("nickName", "required");
		else if(member.getPassword() == null || member.getPassword().trim().isEmpty())
			errors.rejectValue("password", "required");
		
		
		else if(member.isCheck1() == false)
			errors.rejectValue("nickName", "none");
		else if(member.isCheck2() == false)
			errors.rejectValue("password", "wrong");
		
		
	}



}
