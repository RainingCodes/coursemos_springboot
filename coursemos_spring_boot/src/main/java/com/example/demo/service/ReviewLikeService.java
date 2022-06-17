package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.ReviewLike;
import com.example.demo.repository.ReviewLikeRepository;

@Service
@Transactional 
public class ReviewLikeService {
	@Autowired
	private ReviewLikeRepository reviewLikeRepository;
	public void save(ReviewLike reviewLike) {
		reviewLikeRepository.save(reviewLike);
	}
	
	public List<ReviewLike> findReviewLikeByMemberId(Long memberId) {
		return reviewLikeRepository.findReviewLikeByMemberId(memberId);
	}
	
	public boolean findReviewLikeByReviewIdMemberId(Long reviewId, Long memberId) {
		ReviewLike reviewLike = reviewLikeRepository.findReviewLikeByReviewIdAndMemberId(memberId, reviewId);
		if(reviewLike == null) {
			return true;
		} else {
			return false;
		}
	}
	public void delete(ReviewLike reviewLike) {
		reviewLikeRepository.delete(reviewLike);
	}

}
