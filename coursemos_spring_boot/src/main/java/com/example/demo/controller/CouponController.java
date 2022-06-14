package com.example.demo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Company;
import com.example.demo.domain.Coupon;
import com.example.demo.service.CompanyService;
import com.example.demo.service.CouponService;
import com.example.demo.validator.CouponValidator;

@Controller
public class CouponController {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/company/list/coupon")
	public ModelAndView couponList(@RequestParam("companyId") int companyId) {	
		ModelAndView mav = new ModelAndView("coupon/manageCoupon");
		
		Company company = companyService.getCompanyByCompanyId(companyId); // 회사 받아오기
		List<Coupon> coupons = couponService.getCouponByCompanyId(companyId);// 쿠폰 정보들 받아오기
		
		long miliseconds = System.currentTimeMillis();
	    Date current = new Date(miliseconds);	   
		
		for (int i = 0; i < coupons.size(); i++) {
			Coupon tmp = coupons.get(i);
			Date couponDate = tmp.getPeriod();
			if (couponDate.before(current) && tmp.getState() == 0) {
				tmp.setState(1);
				couponService.updateCoupon(tmp);
			}
		}

		mav.addObject("company", company);
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
	public String couponRegister(@ModelAttribute("Coupon") Coupon coupon, @RequestParam("companyId") int companyId, ModelMap model) throws Exception {
		coupon.setCompanyId(companyId);
		Company company = companyService.getCompanyByCompanyId(companyId); // 회사 받아오기
		
		//서비스로 게시글 제목, 글쓴이 가져오는 것 나중에 구현해서 모델에 연결해서 리턴
		//쿠폰 발급기한 나중에 정규식 제한두긴
		model.addAttribute("companyName", company.getPlace().getPlaceName());		
		
		return "coupon/addCoupon";
	}
	
	@RequestMapping(value = "/company/list/coupon/register", method = RequestMethod.POST)
	public ModelAndView courseReportRegister(@Valid @ModelAttribute("Coupon") Coupon coupon, BindingResult result) {
		
		new CouponValidator().validate(coupon, result);
		if (result.hasErrors()) {
			ModelAndView mav = new ModelAndView("coupon/addCoupon");
			mav.addObject(coupon);
			
			Company company = companyService.getCompanyByCompanyId(coupon.getCompanyId());
			mav.addObject("companyName", company.getPlace().getPlaceName());
			return mav;
		}
		
		ModelAndView mav = new ModelAndView("redirect:/company/list/coupon");
		coupon.setState(0);
		couponService.insertCoupon(coupon);
		
		mav.addObject("companyId", coupon.getCompanyId());
		
		return mav;
	}

	@RequestMapping("/company/list/coupon/stop")
	public ModelAndView stopProvideCoupon(@RequestParam("couponId") int couponId) {
		ModelAndView mav = new ModelAndView("redirect:/company/list/coupon");
				
		Coupon coupon = couponService.getCouponByCouponId(couponId);
		mav.addObject("companyId", coupon.getCompanyId());
		coupon.setState(2);
		couponService.updateCoupon(coupon);
		
		return mav;
	}
	
}
