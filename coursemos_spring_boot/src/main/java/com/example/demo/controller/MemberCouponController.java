package com.example.demo.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Coupon;
import com.example.demo.domain.MemberCoupon;
import com.example.demo.service.CouponService;
import com.example.demo.service.MemberCouponService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Controller
public class MemberCouponController {
	
	@Getter @Setter @AllArgsConstructor @NoArgsConstructor
	public class MemberCouponValue {
		MemberCoupon memberCoupon;
		String nickname;
	}
	
	
	@Autowired
	private MemberCouponService memberCouponService;
	@Autowired
	private CouponService couponService;
	
	//리스트
	@RequestMapping("/company/list/coupon/detail")
	public ModelAndView couponList(@RequestParam("couponId") int couponId) {	
		ModelAndView mav = new ModelAndView("coupon/detailCoupon");
		
		List<MemberCouponValue> mcList = new ArrayList<MemberCouponValue>();
		List<MemberCoupon> memberCoupon =  memberCouponService.getUserCouponByCouponId(couponId);
		
		for (MemberCoupon m : memberCoupon) {
			//m을 사용해서 나중에 jpa를 이용해 memberid를 키로 해서 닉네임을 받아온다.
			MemberCouponValue memberCouponValue = new MemberCouponValue(m, "닉네임 jpa 후에 연결");
			mcList.add(memberCouponValue);
		}
		
		Coupon coupon = couponService.getCouponByCouponId(couponId);
		
		mav.addObject("mcList", mcList);
		mav.addObject("coupon", coupon);
		return mav;
	}
	
	//사용
	@RequestMapping("/company/list/coupon/detail/use")
	public ModelAndView useMemberCoupon(@RequestParam("memberCouponId") int memberCouponId) {
		ModelAndView mav = new ModelAndView("redirect:/company/list/coupon/detail");
		// db 처리 후 원래 페이지로
		MemberCoupon memberCoupon = memberCouponService.getUserCouponByMemberCouponId(memberCouponId);
		memberCoupon.setUsed("T");
		memberCouponService.updateMemberCoupon(memberCoupon);
		
		mav.addObject("couponId", memberCoupon.getCouponId());
		
		return mav;
	}
	
	//코스에서 다운받기
	@RequestMapping("/course/view/coupon/get")
	public String getMemberCoupon(@RequestParam("CouponId") int couponId) {
		Coupon coupon = couponService.getCouponByCouponId(couponId);

		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    
        Calendar cal = Calendar.getInstance();
        cal.setTime(current);
		cal.add(Calendar.DATE, coupon.getDay());
		
		MemberCoupon memberCoupon = new MemberCoupon();
		memberCoupon.setCouponId(couponId);
		memberCoupon.setMemberCouponId(1); // 세션 되면 변경하기
		memberCoupon.setUsed("F");
		memberCoupon.setExpirationDate(cal.getTime());
		
		memberCouponService.insertMemberCoupon(memberCoupon);
		
		return "redirect:/user/coupon";
	}
	
	//유저 리스트에서 보이는 내 쿠폰 목록
	@RequestMapping("/user/coupon")
	public ModelAndView MymemberCouponList() {	
		ModelAndView mav = new ModelAndView("생기면 주소 넣기");
		
		List<MemberCoupon> memberCouponList = memberCouponService.getUserCouponByMemberId(1);
			
		mav.addObject("memberCouponList", memberCouponList);
		return mav;
	}
}
