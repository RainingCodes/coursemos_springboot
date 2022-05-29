package com.example.demo.domain;

import java.util.Date;

public class MemberCoupon {
	private int userCouponId;
	private boolean used;
	private Date expriationDate;
	private int userId;
	private int couponId;
	
	public int getUserCouponId() {
		return userCouponId;
	}
	public void setUserCouponId(int userCouponId) {
		this.userCouponId = userCouponId;
	}
	public boolean isUsed() {
		return used;
	}
	public void setUsed(boolean used) {
		this.used = used;
	}
	public Date getExpriationDate() {
		return expriationDate;
	}
	public void setExpriationDate(Date expriationDate) {
		this.expriationDate = expriationDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	
	public MemberCoupon(int userCouponId, boolean used, Date expriationDate, int userId, int couponId) {
		super();
		this.userCouponId = userCouponId;
		this.used = used;
		this.expriationDate = expriationDate;
		this.userId = userId;
		this.couponId = couponId;
	}
	
	public MemberCoupon(Date expriationDate, int userId, int couponId) {
		userCouponId = -1;
		used = false;
		this.expriationDate = expriationDate;
		this.userId = userId;
		this.couponId = couponId;
	}
	
}
