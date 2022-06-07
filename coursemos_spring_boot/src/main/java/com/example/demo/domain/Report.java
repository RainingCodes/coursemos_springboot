package com.example.demo.domain;

import java.util.Date;

import javax.persistence.*;
import lombok.*;

@Entity
@SequenceGenerator(
		  name = "REPORT_SEQ_GENERATOR", 
		  sequenceName = "REPORT_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor 
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPORT_SEQ_GENERATOR")
	private int reportId;
	private int userId;
	
	@Column(name="category")
	private String reportCategory;
	private Date writtenDate;
	private boolean state;
	
	private int courseId;
	private int reviewId;
}
