package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Course;

public interface CourseDao {

	Course getCourseByCourseId(String courseId) throws DataAccessException;
	
	void insertCourse(Course course) throws DataAccessException;

	void deleteCourse(Course course) throws DataAccessException;
	
	// ��Ұ� �� ���� �Է� �� ���
	List<Course> searchCourseListByPlace(String place) throws DataAccessException;

	// ���⿡ ����
	List<Course> getCourseListByTaste(String taste) throws DataAccessException;

	// ���ƿ� ���� ����
	List<Course> getCourseListByLike(int like) throws DataAccessException;

	// �̵��Ÿ��� ����
	List<Course> getCourseListByTime(int time) throws DataAccessException;
	
	// ��Ұ� �� ���� �Է� �� ���
	List<Course> searchCourseListByKeyword(String keyword) throws DataAccessException;

	// ��Ұ� �� �� �Էµ� ��� + �߰� �Ÿ� ���� ���ϱ�
	List<Course> searchCourseListByPlace(String place1, String place2) throws DataAccessException;

	// ���⿡ ����
	List<Course> getCourseListByTaste(String place1, String place2, String taste) throws DataAccessException;

	// ���ƿ� ���� ����
	List<Course> getCourseListByLike(String place1, String place2) throws DataAccessException;

	// �̵��Ÿ��� ����
	List<Course> getCourseListByTime(String place1, String place2) throws DataAccessException;	
	
	
	
	
	
	
	
}
