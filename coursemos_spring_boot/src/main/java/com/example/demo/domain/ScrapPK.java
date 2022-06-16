package com.example.demo.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter @Setter @AllArgsConstructor @ToString
public class ScrapPK implements Serializable {
	Long memberId;
	Long courseId;
}
