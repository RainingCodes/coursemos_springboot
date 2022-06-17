package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.example.demo.domain.Course;

public interface CourseService {
	void insertCourse(Course course);
	void deleteCourse(Course course);
	void updateCourse(Course course);
	Course getCourseByCourseId(int courseId);
	List<Course> getCourseListByMemberId(Long memberId);
	List<Course> findBycourseId(int courseId, Sort sort);
	Page<Course> findAll(Pageable pageable);
	Page<Course> findByPlace1_Subway(String subway, Pageable pageable);
	Page<Course> findCourse1(String taste, Pageable pageable);
	Page<Course> findCourse2(String subway, String taste, Pageable pageable);
}
