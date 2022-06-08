package com.example.demo.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;

@SuppressWarnings("serial")
public class Course implements Serializable {

	private int courseId;
	private String courseName;
	private String courseContents;
	private int memberId;
	private String taste;
	private int likes;
	private Date writtenDate;
	private int place1;
	private int place2;
	private int place3;
	
	public Course() {
		
	}
	
	public Course(int courseId, String courseName, String courseContents, int memberId, String taste, int likes,
			Date writtenDate, int place1, int place2, int place3) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseContents = courseContents;
		this.memberId = memberId;
		this.taste = taste;
		this.likes = likes;
		this.writtenDate = writtenDate;
		this.place1 = place1;
		this.place2 = place2;
		this.place3 = place3;
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
	public int getPlace1() {
		return place1;
	}
	public void setPlace1(int place1) {
		this.place1 = place1;
	}
	public int getPlace2() {
		return place2;
	}
	public void setPlace2(int place2) {
		this.place2 = place2;
	}
	public int getPlace3() {
		return place3;
	}
	public void setPlace3(int place3) {
		this.place3 = place3;
	}
	
	


}
