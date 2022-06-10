package com.example.demo.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@SequenceGenerator(
		  name = "COMPANY_SEQ_GENERATOR", 
		  sequenceName = "COMPANY_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@Setter @Getter @ToString @AllArgsConstructor @NoArgsConstructor 
public class Company {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COMPANY_SEQ_GENERATOR")
	private Integer companyId;
	private Integer memberId;
	private String name;
	private String phone;
	private String address;
	private Date registerDate;
	private Integer accept;
}
