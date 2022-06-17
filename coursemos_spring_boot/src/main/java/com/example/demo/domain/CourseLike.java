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
@IdClass(CourseLikePK.class)
@Getter @Setter  @NoArgsConstructor @AllArgsConstructor @ToString
public class CourseLike {
	@Id Long memberId;
	@Id int courseId;
}
