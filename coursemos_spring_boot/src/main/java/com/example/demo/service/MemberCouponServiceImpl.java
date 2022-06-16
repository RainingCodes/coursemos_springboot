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
	public List<MemberCoupon> getMemberCouponByMemberId(Long memberId) {
		return memberCouponDao.getMemberCouponByMemberId(memberId);
	}

	@Override
	public List<MemberCoupon> getMemberCouponByCouponId(int couponId) {
		return memberCouponDao.getMemberCouponByCouponId(couponId);
	}

	@Override
	public MemberCoupon getMemberCouponByMemberCouponId(int memberCouponId) {
		return memberCouponDao.getMemberCouponByMemberCouponId(memberCouponId);
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
