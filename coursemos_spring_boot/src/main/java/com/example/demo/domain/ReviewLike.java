package com.example.demo.domain;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@IdClass(ReviewLikePK.class)
@ToString @Getter @Setter 
@SuppressWarnings("serial")
@AllArgsConstructor @NoArgsConstructor
public class ReviewLike implements Serializable{
	@Id
	private Long reviewId;
	@Id
	private Long memberId;
}
