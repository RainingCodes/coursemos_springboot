package com.example.demo.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Course implements Serializable {

	private int courseId;
	private String courseContents;
	private String coordinates; //좌표
	private int travelTime; // 소요시간
	private int userId;
	private int[] storeId;
	private String taste; // 취향
	
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseContents() {
		return courseContents;
	}
	public void setCourseContents(String courseContents) {
		this.courseContents = courseContents;
	}
	public String getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}
	public int getTravelTime() {
		return travelTime;
	}
	public void setTravelTime(int time) {
		this.travelTime = time;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int[] getStoreId() {
		return storeId;
	}
	public void setStoreId(int[] storeId) {
		this.storeId = storeId;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	
	public Course(int courseId, String courseContents, String coordinates, int time) {
		super();
		this.courseId = courseId;
		this.courseContents = courseContents;
		this.coordinates = coordinates;
		this.travelTime = time;
	}
	
	public Course(int courseId, String courseContents, String coordinates, int time, int userId, int[] storeId,
			String taste) {
		super();
		this.courseId = courseId;
		this.courseContents = courseContents;
		this.coordinates = coordinates;
		this.travelTime = time;
		this.userId = userId;
		this.storeId = storeId;
		this.taste = taste;
	}

}
