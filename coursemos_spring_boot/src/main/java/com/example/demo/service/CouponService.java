package com.example.demo.service;

import java.util.List;
import com.example.demo.domain.Coupon;

public interface CouponService {
	List<Coupon> getCouponByCompanyId(int companyId);
	Coupon getCouponByCouponId(int couponId); 
	void deleteCoupon(Coupon coupon);
	void updateCoupon(Coupon coupon); 
	void insertCoupon(Coupon coupon);
}
