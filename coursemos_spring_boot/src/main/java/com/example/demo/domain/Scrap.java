package com.example.demo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@IdClass(ScrapPK.class)
@Getter @Setter  @NoArgsConstructor @AllArgsConstructor @ToString
public class Scrap {
	@Id Long memberId;
	@Id int courseId;
}
