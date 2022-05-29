package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Company;
import com.example.demo.domain.Coupon;
import com.example.demo.domain.Report;

@Controller
public class CouponController {
	
	@RequestMapping("/company/list/coupon")
	public ModelAndView couponList(@RequestParam("companyId") String companyId) {	
		ModelAndView mav = new ModelAndView("coupon/manageCoupon");
		
		Company company = new Company(); // 회사 이름 받아오기
		List<Coupon> coupons = new ArrayList<Coupon>(); // 쿠폰 정보들 받아오기
		//companyId로 회사 상세정보 받아와서 넣고 넘기기
		mav.addObject("couponList", coupons);
		return mav;
	}

	@ModelAttribute("Coupon")
	public Coupon formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Coupon coupon = new Coupon();
		    //나중에 연결
			return coupon;
		}
		else return new Coupon();
	}
	
	@RequestMapping(value = "/company/list/coupon/register", method = RequestMethod.GET)
	public String couponRegister(@ModelAttribute("Coupon") Coupon coupon, @RequestParam("companyId") String companyId, ModelMap model) throws Exception {
		coupon.setCompanyId(Integer.parseInt(companyId));
		
		//서비스로 게시글 제목, 글쓴이 가져오는 것 나중에 구현해서 모델에 연결해서 리턴
		//쿠폰 발급기한 나중에 정규식 제한두긴
		model.addAttribute("companyName", "나중에 구현");		
		
		return "report/courseReport";
	}
	
	@RequestMapping(value = "/company/list/coupon/register", method = RequestMethod.POST)
	public String courseReportRegister(@ModelAttribute("Coupon") Coupon coupon) {
		
		//db에 쿠폰연결하고 쿠폰리스트로 리턴
		
		return "/company/list/coupon";
	}

	@RequestMapping("/company/list/coupon/stop")
	public String stopProvideCoupon(@RequestParam("couponId") String couponId) {	
		ModelAndView mav = new ModelAndView("coupon/manageCoupon");
		
		//db에서 지우고 쿠폰리스트로 리턴
		
		return "/company/list/coupon";
	}
	
}
