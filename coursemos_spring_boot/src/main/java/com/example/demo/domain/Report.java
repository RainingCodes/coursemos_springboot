package com.example.demo.domain;

import java.util.Date;

import javax.persistence.*;
import lombok.*;

@Entity
@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor 
public class Report {
	@Id
	private int reportId;
	private int userId;
	
	@Column(name="category")
	private String reportCategory;
	private Date writtenDate;
	private boolean state;
	
	private int courseId;
	private int reviewId;
}
