package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.domain.Review;



public interface ReviewRepository extends CrudRepository<Review, String>{
	List<Review> findReviewByCourseId(int id);

	List<Review> findReviewByReviewId(Long reviewId);

	List<Review> findReviewByMemberId(Long memberId);
}
