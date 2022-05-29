package com.example.demo.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.MemberCoupon;

public interface UserCouponDao {
	
	List<MemberCoupon> getUserCouponByUserId(int userId) throws DataAccessException;
	List<MemberCoupon> getUserCouponByCouponId(int couponId) throws DataAccessException;
	int useUserCoupon(int userCouponId) throws DataAccessException;
	void insertUserCoupon(MemberCoupon userCoupon) throws DataAccessException;
}
