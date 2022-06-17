package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.CourseLike;

public interface CourseLikeService {
	List<CourseLike> getAllCourseLike();
	List<CourseLike> getCourseLikeByMemberId(Long memberId);
	CourseLike getCourseLikeByPrimaryKey(Long memberId, int courseId);
	void insertScrap(CourseLike courseLike);
	void deleteScrap(CourseLike courseLike);
}
