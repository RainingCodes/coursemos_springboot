package com.example.demo.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter @Setter  @NoArgsConstructor @AllArgsConstructor @ToString
public class ReviewReadableMemberPK implements Serializable{
	private Long memberId;
	private Long reviewId;
	

}
