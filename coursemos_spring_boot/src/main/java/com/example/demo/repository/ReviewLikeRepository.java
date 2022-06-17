package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.domain.ReviewLike;

public interface ReviewLikeRepository extends CrudRepository<ReviewLike, String>{
	List<ReviewLike> findReviewLikeByMemberId(Long memberId);
	ReviewLike findReviewLikeByReviewIdAndMemberId(Long reviewId, Long memberId);
	List<ReviewLike> findReviewLikeByReviewId(Long reviewId);
}

