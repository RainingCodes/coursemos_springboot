package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.CourseDao;
import com.example.demo.domain.Course;
import com.example.demo.domain.TasteCategory;

@Repository
public class JpaCourseDao implements CourseDao{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Course getCourseByCourseId(String courseId) throws DataAccessException {
		Query query = em.createQuery("SELECT c FROM Course c WHERE c.courseId = ?1");
		query.setParameter(1, courseId);
		return (Course)query.getSingleResult();
	}

	@Override
	public void insertCourse(Course course) throws DataAccessException {
		em.persist(course);
	}

	@Override
	public void deleteCourse(Course course) throws DataAccessException {
		em.remove(em.merge(course));
	}

	@Override
	public List<Course> searchCourseListByPlace(String place) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> getCourseListByTaste(String taste) throws DataAccessException {
			TypedQuery<Course> query = em.createQuery(
	                "select c from Course c WHERE c.taste = ?1", Course.class);
			query.setParameter(1, taste);
	        return query.getResultList();
	}

	@Override
	public List<Course> getCourseListByLike(int like) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> getCourseListByTime(int time) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> searchCourseListByKeyword(String keyword) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> searchCourseListByPlace(String place1, String place2) throws DataAccessException {
			TypedQuery<Course> query = em.createQuery(
	                "select c from Course c", Course.class);
	        return query.getResultList();

	}

	@Override
	public List<Course> getCourseListByTaste(String place1, String place2, String taste) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> getCourseListByLike(String place1, String place2) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> getCourseListByTime(String place1, String place2) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> getCourseList(String station) throws DataAccessException {
		TypedQuery<Course> query = em.createQuery(
                "select c from Course c", Course.class);
        return query.getResultList();
	}
	
}
