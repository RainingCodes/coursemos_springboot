package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public class MemberCouponController {
	
	
	@RequestMapping("/company/list/coupon/detail")
	public ModelAndView couponList(@RequestParam("couponId") String couponId) {	
		ModelAndView mav = new ModelAndView("coupon/detailCoupon");
		
		List<MemberCouponValue> mcList = new ArrayList<MemberCouponValue>();
		
		//1. couponId로 회사 상세정보 받아와서 넣기
		//2. mcList.coupon.memberId로 닉네임 받아와서 넣기
		//3. 기간 만료인지 확인(use 반영)
		
		mav.addObject("mcList", mcList);
		return mav;
	}
}
