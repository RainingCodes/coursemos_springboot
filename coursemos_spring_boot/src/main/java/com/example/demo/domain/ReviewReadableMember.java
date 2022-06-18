package com.example.demo.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@IdClass(ReviewReadableMemberPK.class)
@ToString @Getter @Setter 
@SuppressWarnings("serial")
@AllArgsConstructor @NoArgsConstructor
public class ReviewReadableMember implements Serializable {
	@Id
	private Long memberId;
	@Id
	private Long reviewId;
}
