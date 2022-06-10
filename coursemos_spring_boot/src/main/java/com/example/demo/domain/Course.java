package com.example.demo.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Entity
@Table(name="COURSE")
@SuppressWarnings("serial")
@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor
@SequenceGenerator(
		name="COURSE_SEQ_GENERATOR",
		sequenceName="COURSE_SEQ",
		initialValue=1, //샘플데이터 때문에 추후 수정필요해보임
		allocationSize = 1	
		)
public class Course implements Serializable {

	@Id @Column(name="courseId")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COURSE_SEQ_GENERATOR")
	private int courseId;
	
	@Column(nullable=false)
	private String courseName;
	
	@Column(nullable=false)
	private String courseContents;
	
	@Column
	private Integer memberId;
	
	@Column(nullable=false)
	private String taste;
	
	@Column(nullable=false)
	private Integer likes;
	
	@Column(nullable=false)
	private Date writtenDate;
	
	@Column
	private Integer placeId1;
	
	@Column
	private Integer placeId2;
	
	@Column
	private Integer placeId3;
	
}