package com.example.demo.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@SequenceGenerator(
		  name = "COUPON_SEQ_GENERATOR", 
		  sequenceName = "COUPON_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@Setter @Getter @ToString @AllArgsConstructor @NoArgsConstructor 
public class Coupon {
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COUPON_SEQ_GENERATOR")
	private int couponId;
	private int companyId;
	private String contents;
	private Date period;
	private int limit;
	private int day;
	private int state;	
}