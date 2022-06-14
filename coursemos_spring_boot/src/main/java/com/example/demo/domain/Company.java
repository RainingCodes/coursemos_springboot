package com.example.demo.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

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
	
	@NotNull
	private String phone;
	@NotNull
	private String address;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date registerDate;
	private Integer accept;
}