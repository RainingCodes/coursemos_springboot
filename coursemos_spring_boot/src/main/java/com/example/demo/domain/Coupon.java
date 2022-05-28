package com.example.demo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class Coupon {
	private int couponId;
	private int companyId;
	private String contents;
	private Date period;
	private int limit;
	private int day;
	private int state;
	
	public Coupon(int couponId, int companyId, String contents, Date period, int limit, int day, int state) {
		super();
		this.couponId = couponId;
		this.companyId = companyId;
		this.contents = contents;
		this.period = period;
		this.limit = limit;
		this.day = day;
		this.state = state;
	}
	
	public Coupon(int companyId, String contents, Date period, int limit, int day) {
		super();
		couponId = -1;
		this.companyId = companyId;
		this.contents = contents;
		this.period = period;
		this.limit = limit;
		this.day = day;
		state = 0;
	}
	public Coupon() {
		// TODO Auto-generated constructor stub
	}
	
	
}