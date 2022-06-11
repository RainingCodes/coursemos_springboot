package com.example.demo.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.MemberCoupon;

public interface MemberCouponService {
	List<MemberCoupon> getUserCouponByMemberId(int memberId);
	List<MemberCoupon> getUserCouponByCouponId(int couponId);
	MemberCoupon getUserCouponByMemberCouponId(int memberCouponId);
	void updateMemberCoupon(MemberCoupon userCoupon);
	void insertMemberCoupon(MemberCoupon userCoupon);
}
