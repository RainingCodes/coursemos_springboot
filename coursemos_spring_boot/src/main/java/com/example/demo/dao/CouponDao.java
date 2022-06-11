package com.example.demo.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Coupon;

public interface CouponDao {
	List<Coupon> getCouponByCompanyId(int companyId) throws DataAccessException;
	Coupon getCouponByCouponId(int couponId) throws DataAccessException;
	void deleteCoupon(Coupon coupon) throws DataAccessException;
	void updateCoupon(Coupon coupon) throws DataAccessException;
	void insertCoupon(Coupon coupon) throws DataAccessException;
}
