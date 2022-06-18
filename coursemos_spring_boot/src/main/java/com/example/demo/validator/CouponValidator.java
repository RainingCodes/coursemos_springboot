package com.example.demo.validator;

import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.Coupon;

public class CouponValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Coupon.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Coupon coupon = (Coupon) target;
		
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    
	    
	    
		Date couponDate = coupon.getPeriod();
		
		if (couponDate == null) {
			errors.rejectValue("period", "required");
		}
		
		try{
			if (couponDate.before(current)) {
				errors.rejectValue("period", "future");
			}
		} catch(NullPointerException e) {
			
		}	
	}

}
