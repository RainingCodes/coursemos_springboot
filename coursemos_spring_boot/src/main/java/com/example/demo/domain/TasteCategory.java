package com.example.demo.domain;

//public enum TasteCategory {
//	Active, Nature, Retro
//}
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@SuppressWarnings("serial")
@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor
public class TasteCategory implements Serializable {

	@Id
	@Column(nullable=false)
	private String name;

}