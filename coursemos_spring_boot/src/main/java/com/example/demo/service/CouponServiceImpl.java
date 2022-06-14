package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CouponDao;
import com.example.demo.domain.Coupon;

@Service("CouponServiceImpl")
@Transactional
public class CouponServiceImpl implements CouponService{
	
	@Autowired 
	@Qualifier("jpaCouponDao")
	private CouponDao couponDao ;
	
	@Override
	public List<Coupon> getCouponByCompanyId(Long companyId) {
		return couponDao.getCouponByCompanyId(companyId);
	}

	@Override
	public Coupon getCouponByCouponId(int couponId) {
		return couponDao.getCouponByCouponId(couponId);
	}

	@Override
	public void deleteCoupon(Coupon coupon) {
		couponDao.deleteCoupon(coupon);
	}

	@Override
	public void updateCoupon(Coupon coupon) {
		couponDao.updateCoupon(coupon);
	}

	@Override
	public void insertCoupon(Coupon coupon) {
		couponDao.insertCoupon(coupon);
	}

}
