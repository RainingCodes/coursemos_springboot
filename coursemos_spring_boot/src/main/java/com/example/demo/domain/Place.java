package com.example.demo.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@SequenceGenerator(
		  name = "PLACE_SEQ_GENERATOR", 
		  sequenceName = "PLACE_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor
@Table(name="PLACE")
public class Place {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PLACE_SEQ_GENERATOR")
	@Column(name="placeId")
	Integer placeId;
	@NotNull
	String taste;
	@NotNull
	String placeName;
	double x;
	double y;
	String subway;
}
