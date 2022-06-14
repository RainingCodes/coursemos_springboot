package com.example.demo.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

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
		initialValue=348, //샘플데이터 때문에 추후 수정필요해보임
		allocationSize = 1	
		)
@Table(name="Course")
public class Course {

	@Id @Column
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COURSE_SEQ_GENERATOR")
	private int courseId;
	
	@Column(nullable=false)
	private String courseName;
	
	@Column(nullable=false)
	private String courseContents;
	
	private Integer memberId;
	
	private String taste;
	
	@Column(nullable=false)
	private Integer likes = 0;
	
	@Column(nullable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date writtenDate;

	@OneToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "placeId1")
	private Place placeId1;
	@OneToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "placeId2")
	private Place placeId2;
	@OneToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "placeId3")
	private Place placeId3;
	
}