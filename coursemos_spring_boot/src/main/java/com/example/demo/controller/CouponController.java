package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.domain.Coupon;

@Controller
public class CouponController {
	
	@RequestMapping("/company/list/coupon")
	public ModelAndView companyDetail(@RequestParam("companyId") String companyId) {	
		ModelAndView mav = new ModelAndView("coupon/manageCoupon");
		
		Coupon coupon = new Coupon();
		//companyId로 회사 상세정보 받아와서 넣고 넘기기
		mav.addObject("coupon", coupon);
		return mav;
	}

	
	
}
