package com.example.demo.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CourseDao;
import com.example.demo.domain.Course;

@Service("CourseServiceImpl")
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
	public void updateCourse(Course course) {
		courseDao.updateCourse(course);
	}

	@Override
	public void deleteCourse(Course course) {
		courseDao.deleteCourse(course);	
	}

	@Override
	public Course getCourseByCourseId(int courseId) {
		return courseDao.getCourseByCourseId(courseId);
	}
	
}
