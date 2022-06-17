package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CourseDao;
import com.example.demo.dao.ReportDao;
import com.example.demo.dao.TasteCategoryDao;
import com.example.demo.domain.Course;
import com.example.demo.domain.Report;
import com.example.demo.repository.CourseRepository;
import com.example.demo.repository.SearchRepository;

@Service("SearchServiceImpl")
@Transactional
public class SearchServiceImpl implements SearchService {
	
		@Autowired 
		@Qualifier("jpaCourseDao")
		CourseDao courseDao;
		@Autowired 
		@Qualifier("jpaTasteCategoryDao")
		TasteCategoryDao tasteCategoryDao;

		
		@Autowired
		private SearchRepository searchRepository;
		
		public void setSearchRepository(SearchRepository searchRepository) {
			this.searchRepository = searchRepository;
		}
		
		public List<Course> getCourse(int courseId) {
			List<Course> result = searchRepository.findByCourseId(courseId);
			return null;
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
		public List<Course> getCourseList(String subway) throws DataAccessException {
			// TODO Auto-generated method stub
			return courseDao.getCourseList(subway);
		}

		@Override
		public List<Course> getCourseListByTaste(String subway, String taste) throws DataAccessException {
			// TODO Auto-generated method stub
			return courseDao.getCourseListByTaste(subway, taste);
		}
		

		@Transactional
		public Page<Course> getCoursePageList(Pageable pageable) throws DataAccessException {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<Course> getCourseByCourseId(int courseId) throws DataAccessException {
			return courseDao.getCourseList("월곡역");
		}
		


}
