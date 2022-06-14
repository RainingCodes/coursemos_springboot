package com.example.demo.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Entity
@SuppressWarnings("serial")
@SequenceGenerator(
		  name = "POINTS_SEQ_GENERATOR", 
		  sequenceName = "POINTS_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@Getter @Setter  @AllArgsConstructor @ToString
public class Points implements Serializable{
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "POINTS_SEQ_GENERATOR")
	@Id @Column(name="pointsId") @Getter 
	private Long id;
	@Column(nullable=false) @Getter @Setter 
	private int points;
	@Column(nullable=false) @Getter @Setter 
	private int type;
	@Column(nullable=false) @Getter @Setter 
	private Long memberId;
	@Column(nullable=false) @Getter @Setter 
	private Date pointsDate;
	public Points() {
		this.points = 20;
		this.type = 0;
	}
	public String getTypeString() {
		switch(this.type) {
			case 0 :
				return "가입 포인트";
			case 1 :
				return "코스 작성";
			case 2:
				return "리뷰 작성";
			case 3:
				return "리뷰 열람";
			default :
				return null;
		}
	}public String getTypeString2() {
		switch(this.type) {
		case 0 :
			return "+20";
		case 1 :
			return "+20";
		case 2:
			return "+20";
		case 3:
			return "-5";
		default :
			return null;
	}
}
}
