package com.example.demo.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CourseDao;
import com.example.demo.domain.Course;

@Service("courseServiceImpl")
@Transactional
public class CourseServiceImpl implements CourseService{

	@Autowired
	@Qualifier("jpaCourseDao")
	private CourseDao courseDao;
		
	@Override
	public void insertCourse(Course course) {
		courseDao.insertCourse(course);	
	}

	@Override
	public void deleteCourse(Course course) {
		courseDao.deleteCourse(course);	
	}
	
}