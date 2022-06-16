package com.example.demo.domain;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter @Setter  @AllArgsConstructor @ToString
public class Scrap {
	Long memberId;
	Long courseId;
}
