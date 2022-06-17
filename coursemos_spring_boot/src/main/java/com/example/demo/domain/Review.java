package com.example.demo.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@SequenceGenerator(
		  name = "REVIEW_SEQ_GENERATOR", 
		  sequenceName = "REVIEW_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@SuppressWarnings("serial")
@AllArgsConstructor @Getter @Setter @ToString
public class Review implements Serializable {
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REVIEW_SEQ_GENERATOR")
	@Id @Column @Getter
	private Long reviewId;
	@Column(nullable=false) @Setter @Getter @NotEmpty(message="리뷰 내용은 빌 수 없습니다.")
	private String reviewContents;
	@Transient
	private MultipartFile photo;
	@Column  @Setter @Getter
	private String photos;
	@Column(nullable=false) @Setter @Getter
	private Date writtenDate;
	@Column(nullable=false) @Setter @Getter
	private int likes;
	@Column(nullable=false) @Setter @Getter
	private Long memberId;
	@Column(nullable=false) @Setter @Getter
	private Long courseId;
	@Transient
	private String courseName;
	public Review() {
		this.likes = 0;
	}

}
