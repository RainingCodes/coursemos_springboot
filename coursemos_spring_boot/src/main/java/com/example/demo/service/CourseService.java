package com.example.demo.service;

import com.example.demo.domain.Course;

public interface CourseService {
	void insertCourse(Course course);
	void deleteCourse(Course course);
	void updateCourse(Course course);
	Course getCourseByCourseId(int courseId);
}
