package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.ReviewReadableMember;
import com.example.demo.repository.ReviewReableMemberRepository;

@Service
@Transactional 
public class ReviewReadableMemberService {
	@Autowired
	private ReviewReableMemberRepository reviewReadableMemberRepository;
	
	public List<ReviewReadableMember> findReviewReadableMemberByMemberId(Long memberId) {
		List<ReviewReadableMember> l = reviewReadableMemberRepository.findReviewReadableMemberByMemberId(memberId);
		System.out.println(l);
		return l;
	}
	public List<ReviewReadableMember> findReviewReadableMemberByReviewId(Long reviewId) {
		return reviewReadableMemberRepository.findReviewReadableMemberByReviewId(reviewId);
	}
	public boolean findReviewReadableMemberByMemberIdReviewId(Long memberId, Long reviewId) {
		ReviewReadableMember rrm = reviewReadableMemberRepository.findReviewReadableMemberByMemberIdAndReviewId(memberId, reviewId);
		if(rrm == null)
			return false;
		return true;
		
	}
	
	
	public void save(ReviewReadableMember reviewReadableMember) {
		reviewReadableMemberRepository.save(reviewReadableMember);
	}
	public void delete(ReviewReadableMember reviewReadableMember) {
		reviewReadableMemberRepository.delete(reviewReadableMember);
	}
	
}
