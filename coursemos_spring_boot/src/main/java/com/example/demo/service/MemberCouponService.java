package com.example.demo.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.MemberCoupon;

public interface MemberCouponService {
	List<MemberCoupon> getMemberCouponByMemberId(Long long1);
	List<MemberCoupon> getMemberCouponByCouponId(int couponId);
	MemberCoupon getMemberCouponByMemberCouponId(int memberCouponId);
	void updateMemberCoupon(MemberCoupon userCoupon);
	void insertMemberCoupon(MemberCoupon userCoupon);
}
