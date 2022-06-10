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
		  name = "MEMBERCOUPON_SEQ_GENERATOR", 
		  sequenceName = "MEMBERCOUPON_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@Setter @Getter @ToString @AllArgsConstructor @NoArgsConstructor 
public class MemberCoupon {
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBERCOUPON_SEQ_GENERATOR")
	private int userCouponId;
	private boolean used;
	private Date expriationDate;
	private int userId;
	private int couponId;	
}
