package com.example.demo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class Company {
	private int companyId;
	private int memberId;
	private String name;
	private String phone;
	private String address;
	private Date registerDate;
	private int accept;
	
	public Company(int memberId, String name, String phone, String address,Date registerDate) {
		companyId = -1;
		this.memberId = memberId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.registerDate = registerDate;
		accept = 0;
	}
	
	public Company(int companyId, int memberId, String name, String phone, String address, Date registerDate,
			int accept) {
		super();
		this.companyId = companyId;
		this.memberId = memberId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.registerDate = registerDate;
		this.accept = accept;
	}
	public Company() {
		// TODO Auto-generated constructor stub
	}
	
	
}
