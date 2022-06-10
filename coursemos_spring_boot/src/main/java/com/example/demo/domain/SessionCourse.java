package com.example.demo.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@AllArgsConstructor @Getter @Setter
public class SessionCourse implements Serializable{
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
	
	public SessionCourse() {
		
	}

}
