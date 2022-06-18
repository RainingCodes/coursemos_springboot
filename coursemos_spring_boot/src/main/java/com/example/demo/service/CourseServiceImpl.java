package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CourseDao;
import com.example.demo.domain.Course;
import com.example.demo.repository.CourseRepository;

@Service("CourseServiceImpl")
@Transactional
public class CourseServiceImpl implements CourseService{

	@Autowired
	@Qualifier("jpaCourseDao")
	private CourseDao courseDao;
	
	@Autowired
	private CourseRepository courseRepository;
	
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
	
	@Override
	public List<Course> getCourseList(){
		return courseDao.getCourseList();
	}
	
	@Override
	public List<Course> getCourseListByMemberId(Long memberId) {
		// TODO Auto-generated method stub
		return courseRepository.findCourseListByMemberId(memberId);
	}


	public Page<Course> findAll(Pageable pageable) {
		return courseRepository.findAll(pageable);
	}

	public Page<Course> findByPlace1Subway(String subway, Pageable pageable) {
		return courseRepository.findByPlace1Subway(subway, pageable);
	}

	@Override
	public Page<Course> findCourse1(String taste, Pageable pageable) {
		return courseRepository.findCourse1(taste, pageable);
	}
	
	@Override
	public Page<Course> findCourse2(String subway, String taste, Pageable pageable) {
		return courseRepository.findCourse2(subway, taste, pageable);
	}

//	@Override
//	public Page<Course> findByPlace1SubwayOrderByLikes(String subway, Pageable pageable) {
//		return courseRepository.findByPlace1SubwayOrderByLikes(subway, pageable);
//	}

	

	
}
