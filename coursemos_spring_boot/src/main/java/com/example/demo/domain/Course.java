package com.example.demo.domain;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Course implements Serializable {

	private int courseId;
	private String courseName;
	private String courseContents;
	private String[] coordinates; //좌표
	private int travelTime;
	private int memberId;
	private String taste;
	private String photo;
	private int likes;
	private Date writtenDate;
	
	public Course() {
		
	}
	
	public Course(int courseId, String courseName, String courseContents, String[] coordinates, int travelTime,
			int memberId, String taste, String photo, int likes, Date writtenDate) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseContents = courseContents;
		this.coordinates = coordinates;
		this.travelTime = travelTime;
		this.memberId = memberId;
		this.taste = taste;
		this.photo = photo;
		this.likes = likes;
		this.writtenDate = writtenDate;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseContents() {
		return courseContents;
	}
	public void setCourseContents(String courseContents) {
		this.courseContents = courseContents;
	}
	public String[] getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(String[] coordinates) {
		this.coordinates = coordinates;
	}
	public int getTravelTime() {
		return travelTime;
	}
	public void setTravelTime(int travelTime) {
		this.travelTime = travelTime;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	} 
	
	


}
