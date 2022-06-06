package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter  @AllArgsConstructor
public class Points {
	private int points;
	private String type;
	private int memberId;
}
