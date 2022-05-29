package com.example.demo.controller;

import java.io.Serializable;
import com.example.demo.domain.MemberCoupon;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("serial")
public class MemberCouponValue implements Serializable {
	private MemberCoupon memberCoupon;
	private String nickname;
	private int use;
	
	public MemberCouponValue() {}
	public MemberCouponValue(MemberCoupon memberCoupon, String nickname, int use) {
		this.memberCoupon = memberCoupon;
		this.nickname = nickname;
		this.use = use;
	}
}
