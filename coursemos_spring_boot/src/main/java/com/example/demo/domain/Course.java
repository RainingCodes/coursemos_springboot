package com.example.demo.domain;

import java.util.Date;

import javax.persistence.Column;
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
@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor
@SequenceGenerator(
		name="COURSE_SEQ_GENERATOR",
		sequenceName="COURSE_SEQ",
		initialValue=400, //샘플데이터 때문에 추후 수정필요해보임
		allocationSize = 1	
		)
public class Course {

	@Id @Column(name="courseId")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COURSE_SEQ_GENERATOR")
	private int courseId;
	
	@Column(nullable=false)
	private String courseName;
	
	@Column(nullable=false)
	private String courseContents;
	
	private Integer memberId;
	
	private String taste;
	
	@Column(nullable=false)
	private Integer likes;
	
	@Column(nullable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date writtenDate;
	
	private Integer placeId1;
	private Integer placeId2;
	private Integer placeId3;
	
}