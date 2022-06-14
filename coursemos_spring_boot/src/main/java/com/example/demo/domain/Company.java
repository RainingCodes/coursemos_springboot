package com.example.demo.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter @Getter @ToString @AllArgsConstructor @NoArgsConstructor 
public class Company {
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "placeId")
	private Place place;
	
	@Id
	private Long companyId;
	private Integer memberId;
	
	@Pattern(regexp="\\d{3}-\\d{3,4}-\\d{4}", message="010-0000-0000 형식으로 입력해주세요.")
	private String phone;
	@NotEmpty
	private String address;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date registerDate;
	private Integer accept;
}