package com.example.demo.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Coupon;

public interface CouponDao {
	List<Coupon> getCouponByCompanyId(int companyId) throws DataAccessException;
	int deleteCoupon(int couponId) throws DataAccessException;
	int stopProvideCoupon(int couponId) throws DataAccessException;
	void insertCoupon(Coupon coupon) throws DataAccessException;
}
