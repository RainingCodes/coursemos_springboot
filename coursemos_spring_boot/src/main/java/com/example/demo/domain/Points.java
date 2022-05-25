package com.example.demo.domain;

public class Points {
	private int points;
	private String type;
	private int userId;
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Points(int userId, String type) {
		this.userId = userId;
		this.points = 20;
		this.type = type;
	}
}
