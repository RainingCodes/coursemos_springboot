package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberCouponDao;
import com.example.demo.domain.MemberCoupon;

@Service("MemberCouponServiceImpl")
@Transactional
public class MemberCouponServiceImpl implements MemberCouponService {
	
	@Autowired 
	@Qualifier("jpaMemberCouponDao")
	private MemberCouponDao memberCouponDao;

	@Override
	public List<MemberCoupon> getUserCouponByMemberId(int memberId) {
		return memberCouponDao.getUserCouponByMemberId(memberId);
	}

	@Override
	public List<MemberCoupon> getUserCouponByCouponId(int couponId) {
		return memberCouponDao.getUserCouponByCouponId(couponId);
	}

	@Override
	public MemberCoupon getUserCouponByMemberCouponId(int memberCouponId) {
		return memberCouponDao.getUserCouponByMemberCouponId(memberCouponId);
	}

	@Override
	public void updateMemberCoupon(MemberCoupon userCoupon) {
		memberCouponDao.updateMemberCoupon(userCoupon);
	}

	@Override
	public void insertMemberCoupon(MemberCoupon userCoupon) {
		memberCouponDao.insertMemberCoupon(userCoupon);
	}

}
