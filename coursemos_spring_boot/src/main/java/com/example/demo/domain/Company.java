package com.example.demo.domain;

import java.util.Date;

public class Company {
	private int companyId;
	private int userId; // ���� ����� ������ ���̵�
	private String name;
	private String phone;
	private String address;
	private int storeId;
	private Date registerDate; // ��� ��¥
	private int accept; // ���� ���� ����
	
	
	
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public int getAccept() {
		return accept;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	
	public Company(int userId, String name, String phone, String address, int storeId, Date registerDate) {
		companyId = -1;
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.storeId= storeId;
		this.registerDate = registerDate;
		accept = 0;
	}
	
	public Company(int companyId, int userId, String name, String phone, String address, int storeId, Date registerDate,
			int accept) {
		super();
		this.companyId = companyId;
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.registerDate = registerDate;
		this.accept = accept;
		this.storeId= storeId;
	}
	public Company() {
		// TODO Auto-generated constructor stub
	}
	
	
}
