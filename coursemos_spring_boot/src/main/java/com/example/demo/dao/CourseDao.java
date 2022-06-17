package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Course;

public interface CourseDao {

	Course getCourseByCourseId(int courseId) throws DataAccessException;
	
	void insertCourse(Course course) throws DataAccessException;

	void deleteCourse(Course course) throws DataAccessException;
	
	void updateCourse(Course course);
	
	List<Course> searchCourseListByPlace(String place) throws DataAccessException;

	List<Course> getCourseListByTaste(String taste) throws DataAccessException;

	List<Course> getCourseListByLike(int like) throws DataAccessException;

	List<Course> getCourseListByTime(int time) throws DataAccessException;
	
	List<Course> searchCourseListByKeyword(String keyword) throws DataAccessException;

	List<Course> searchCourseListByPlace(String place1, String place2) throws DataAccessException;

	List<Course> getCourseListByTaste(String place1, String place2, String taste) throws DataAccessException;

	List<Course> getCourseListByLike(String place1, String place2) throws DataAccessException;

	List<Course> getCourseListByTime(String place1, String place2) throws DataAccessException;	
	
	List<Course> getCourseList(String station) throws DataAccessException;	
	
	List<Course> getCourseListByTaste(String subway, String taste) throws DataAccessException;
	
	
	
	
}
