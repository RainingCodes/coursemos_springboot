package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.CourseLike;

public interface CourseLikeDao {
	List<CourseLike> getAllCourseLike() throws DataAccessException;
	List<CourseLike> getCourseLikeByMemberId(Long memberId) throws DataAccessException;
	CourseLike getCourseLikeByPrimaryKey(Long memberId, int courseId) throws DataAccessException;
	void insertScrap(CourseLike courseLike) throws DataAccessException;
	void deleteScrap(CourseLike courseLike) throws DataAccessException;
}
