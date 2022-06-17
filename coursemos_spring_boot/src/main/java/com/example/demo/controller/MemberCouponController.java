package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Coupon;
import com.example.demo.domain.MemberCoupon;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CompanyService;
import com.example.demo.service.CouponService;
import com.example.demo.service.MemberCouponService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Controller
@SessionAttributes("sessionMember")
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
	@Autowired
	private CompanyService companyService;
	
	//리스트
	@RequestMapping("/company/list/coupon/detail")
	public ModelAndView couponList(@RequestParam("couponId") int couponId) {	
		ModelAndView mav = new ModelAndView("coupon/detailCoupon");
		
		List<MemberCouponValue> mcList = new ArrayList<MemberCouponValue>();
		List<MemberCoupon> memberCoupon =  memberCouponService.getMemberCouponByCouponId(couponId);
		
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
		MemberCoupon memberCoupon = memberCouponService.getMemberCouponByMemberCouponId(memberCouponId);
		memberCoupon.setUsed("T");
		memberCouponService.updateMemberCoupon(memberCoupon);
		
		mav.addObject("couponId", memberCoupon.getCouponId());
		
		return mav;
	}
	
		
	//코스에서 다운받기
	@RequestMapping("/course/view/coupon/get")
	public ModelAndView getMemberCoupon(@ModelAttribute SessionMember sessionMember, @RequestParam("couponId") int couponId) {
		ModelAndView mav = new ModelAndView("alert");
		Coupon coupon = couponService.getCouponByCouponId(couponId);

		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);
	    
        Calendar cal = Calendar.getInstance();
        cal.setTime(current);
		cal.add(Calendar.DATE, coupon.getDay());
		
		MemberCoupon memberCoupon = new MemberCoupon();
		memberCoupon.setCouponId(couponId);
		memberCoupon.setMemberId(sessionMember.getId()); // 세션 되면 변경하기
		memberCoupon.setUsed("F");
		memberCoupon.setExpirationDate(cal.getTime());
		
		memberCouponService.insertMemberCoupon(memberCoupon);
		
		mav.addObject("msg", "쿠폰이 발급되었습니다. 마이페이지에서 확인 가능합니다.");
		mav.addObject("url", "closePage");
		return mav;
	}
	
	@Getter @Setter @AllArgsConstructor @ToString
	public class MemberCouponView {
		private String placeName;
		private String couponContent;
		private MemberCoupon memberCoupon;
	}
	
	//유저 리스트에서 보이는 내 쿠폰 목록
	@RequestMapping("/member/coupon/list")
	public ModelAndView MymemberCouponList(@ModelAttribute SessionMember sessionMember) {	
		ModelAndView mav = new ModelAndView("member/couponList");
		
		ArrayList<MemberCouponView> mcv = new ArrayList<MemberCouponView>();
		
		List<MemberCoupon> memberCouponList = memberCouponService.getMemberCouponByMemberId(sessionMember.getId());
		
		for (MemberCoupon m : memberCouponList) {
			Coupon c = couponService.getCouponByCouponId(m.getCouponId());
			Long companyId = c.getCompanyId();
			String couponContent = c.getCouponContents();
			String placeName = companyService.getCompanyByCompanyId(companyId).getPlace().getPlaceName();
			
			mcv.add(new MemberCouponView(placeName, couponContent, m));
		}
		
		mav.addObject("memberCouponList", mcv);
		return mav;
	}
}
