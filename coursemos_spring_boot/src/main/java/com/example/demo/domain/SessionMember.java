package com.example.demo.domain;

import java.io.Serializable;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor @Getter @Setter @ToString
public class SessionMember implements Serializable {
	private long id;
	private String nickName;
	private String password;
	private int points;
	private String tasteCode;
	private boolean check1;
	private boolean check2;
	public SessionMember() {
		
	}
	
	
	
}
