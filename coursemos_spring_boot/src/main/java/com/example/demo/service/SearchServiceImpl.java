package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CourseDao;
import com.example.demo.dao.ReportDao;
import com.example.demo.dao.TasteCategoryDao;
import com.example.demo.domain.Course;
import com.example.demo.domain.Report;

@Service("SearchServiceImpl")
@Transactional
public class SearchServiceImpl implements SearchService {
	
		@Autowired 
		@Qualifier("jpaCourseDao")
		CourseDao courseDao;
		@Autowired 
		@Qualifier("jpaTasteCategoryDao")
		TasteCategoryDao tasteCategoryDao;
		public Course getCourseByCourseId(String courseId) throws DataAccessException {
			return courseDao.getCourseByCourseId(courseId);
		}
	
	
		public void insertCourse(Course course) throws DataAccessException {
			return;
		}
	
		public List<Course> searchCourseListByPlace(String place) throws DataAccessException {
			return courseDao.searchCourseListByKeyword(place);
		}
		
		public List<Course> getCourseListByTaste(String taste) throws DataAccessException {
			return courseDao.getCourseListByTaste(taste);
		}
	
		public List<Course> getCourseListByLike(int like) throws DataAccessException {
			return courseDao.getCourseListByLike(like);
		}
		public List<Course> getCourseListByTime(int time) throws DataAccessException {
			return courseDao.getCourseListByTime(time);
		}
	
		public List<Course> searchCourseListByKeyword(String keyword) throws DataAccessException {
			return courseDao.searchCourseListByKeyword(keyword);
		}
	
		public List<Course> searchCourseListByPlace(String place1, String place2) throws DataAccessException {
			return courseDao.searchCourseListByPlace(place1, place2);
		}
	
		public List<Course> getCourseListByTaste(String place1, String place2, String taste) throws DataAccessException {
			return courseDao.getCourseListByTaste(place1, place2, taste);
		}
		
		public List<Course> getCourseListByLike(String place1, String place2) throws DataAccessException {
			return courseDao.getCourseListByLike(place1, place2);
		}
	
		public List<Course> getCourseListByTime(String place1, String place2) throws DataAccessException {
			return courseDao.getCourseListByTime(place1, place2);
		}


		@Override
		public List<Course> getCourseList(double x, double y, String station) throws DataAccessException {
			// TODO Auto-generated method stub
			return courseDao.getCourseList(x, y, station);
		}



	
		
	
	

}
