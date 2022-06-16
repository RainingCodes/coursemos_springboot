package com.example.demo.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.format.annotation.DateTimeFormat;

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
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBERCOUPON_SEQ_GENERATOR")
	private int memberCouponId;
	private String used;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date expirationDate;
	private Long memberId;
	private int couponId;	
}
