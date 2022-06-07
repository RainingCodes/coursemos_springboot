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
	public List<Report> getAllReport() throws DataAccessException {
		TypedQuery<Report> query = em.createQuery(
                "select report from Report report", Report.class);
        return query.getResultList();
	}

	@Override
	public void insertReport(Report report) throws DataAccessException {
		em.persist(report);
	}

	@Override
	public void updateReport(Report report) throws DataAccessException {
		em.merge(report);
	}
}
