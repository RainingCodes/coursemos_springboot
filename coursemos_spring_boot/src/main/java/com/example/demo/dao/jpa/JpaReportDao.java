package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.ReportDao;
import com.example.demo.domain.Report;

@Repository
public class JpaReportDao implements ReportDao {
	@PersistenceContext
    private EntityManager em;

	@Override
	public List<Report> getAllCourseReport() throws DataAccessException {
		TypedQuery<Report> query = em.createQuery(
                "select r from Report r " + "where r.courseId IS NOT NULL", Report.class);
        return query.getResultList();
	}
	
	@Override
	public List<Report> getAllReviewReport() throws DataAccessException {
		TypedQuery<Report> query = em.createQuery(
                "select r from Report r " + "where r.reviewId IS NOT NULL", Report.class);
        return query.getResultList();
	}
	
	@Override
	public Report getReportById(int reportId) throws DataAccessException {
		return em.find(Report.class, reportId);
	}

	@Override
	public void insertReport(Report report) throws DataAccessException {
		em.persist(report);
	}

	@Override
	public void updateReport(Report report) throws DataAccessException {
		em.merge(report);
	}

	@Override
	public List<Report> getReportByMemberId(Long memberId) throws DataAccessException {
		TypedQuery<Report> query = em.createQuery(
                "select r from Report r " + "where r.memberId = ?1", Report.class);
		query.setParameter(1, memberId);
        return query.getResultList();
	}

	
}
