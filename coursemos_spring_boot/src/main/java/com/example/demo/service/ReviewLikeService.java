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
	public List<ReviewLike> findReviewLikeByReviewId(Long reviewId) {
		return reviewLikeRepository.findReviewLikeByReviewId(reviewId);
	}
	
	public boolean findReviewLikeByReviewIdMemberId(Long reviewId, Long memberId) {
		ReviewLike reviewLike = reviewLikeRepository.findReviewLikeByReviewIdAndMemberId(reviewId, memberId);
		System.out.println(reviewLike);
		if(reviewLike == null) {
			return false;
		} else {
			return true;
		}
	}
	public void delete(ReviewLike reviewLike) {
		reviewLikeRepository.delete(reviewLike);
	}

}
