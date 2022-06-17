package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CourseLikeDao;
import com.example.demo.domain.CourseLike;

@Service("CourseLikeServiceImpl")
@Transactional
public class CourseLikeServiceImpl implements CourseLikeService {
	
	@Autowired 
	@Qualifier("jpaCourseLikeDao")
	private CourseLikeDao courseLikeDao;

	@Override
	public List<CourseLike> getAllCourseLike() {
		return courseLikeDao.getAllCourseLike();
	}

	@Override
	public List<CourseLike> getCourseLikeByMemberId(Long memberId) {
		return courseLikeDao.getCourseLikeByMemberId(memberId);
	}

	@Override
	public CourseLike getCourseLikeByPrimaryKey(Long memberId, int courseId) {
		return courseLikeDao.getCourseLikeByPrimaryKey(memberId, courseId);
	}

	@Override
	public void insertScrap(CourseLike courseLike) {
		courseLikeDao.insertScrap(courseLike);
	}

	@Override
	public void deleteScrap(CourseLike courseLike) {
		courseLikeDao.deleteScrap(courseLike);
	}

}
