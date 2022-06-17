package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.domain.ReviewReadableMember;

public interface ReviewReableMemberRepository extends CrudRepository<ReviewReadableMember, String>{
	List<ReviewReadableMember> findReviewReadableMemberByMemberId(Long memberId);
	ReviewReadableMember findReviewReadableMemberByMemberIdAndReviewId(Long memberId, Long reviewId);
}
