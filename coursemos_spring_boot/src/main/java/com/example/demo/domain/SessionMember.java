package com.example.demo.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor @Getter @Setter
public class SessionMember implements Serializable {
	private String nickName;
	private String password;
	public SessionMember() {
		
	}
}
