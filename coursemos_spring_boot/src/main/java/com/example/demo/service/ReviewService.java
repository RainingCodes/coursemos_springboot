package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.Review;
import com.example.demo.repository.ReviewRepository;

@Service
@Transactional 
public class ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;
	
	public void insertReview(Review review) {
		reviewRepository.save(review);
	}
	public void delete(Review review) {
		reviewRepository.delete(review);
	}
	public List<Review> findReviewByCourseId(String courseId) {
		return reviewRepository.findReviewByCourseId(courseId);
	}
	public Review findReviewById(Long reviewId) {
		List<Review> review = (List<Review>) reviewRepository.findReviewByReviewId(reviewId);
		if(review.size() == 0)
			return null;
		return review.get(0);
	}

}
