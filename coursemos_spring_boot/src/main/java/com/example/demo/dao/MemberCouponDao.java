package com.example.demo.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.MemberCoupon;

public interface MemberCouponDao {
	
	List<MemberCoupon> getUserCouponByMemberId(int memberId) throws DataAccessException;
	List<MemberCoupon> getUserCouponByCouponId(int couponId) throws DataAccessException;
	MemberCoupon getUserCouponByMemberCouponId(int memberCouponId) throws DataAccessException;
	void updateMemberCoupon(MemberCoupon userCoupon) throws DataAccessException;
	void insertMemberCoupon(MemberCoupon userCoupon) throws DataAccessException;
}
