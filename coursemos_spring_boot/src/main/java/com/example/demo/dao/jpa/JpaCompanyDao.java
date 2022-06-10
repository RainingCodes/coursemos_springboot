package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.CompanyDao;
import com.example.demo.domain.Company;

@Repository
public class JpaCompanyDao implements CompanyDao {
	@PersistenceContext
    private EntityManager em;
	
	@Override
	public List<Company> getAllCompany() throws DataAccessException {
		TypedQuery<Company> query = em.createQuery(
                "select c from Company c ", Company.class);
        return query.getResultList();
	}
	
	@Override
	public List<Company> getCompanyByUserId(int userId) throws DataAccessException {
		TypedQuery<Company> query = em.createQuery(
                "select c from Report c " + "where c.userId = ?1", Company.class);
		query.setParameter("userId", userId);
        return query.getResultList();
	}

	@Override
	public Company getCompanyByCompanyId(int companyId) throws DataAccessException {
		return em.find(Company.class, companyId);
	}

	@Override
	public void insertCompany(Company company) throws DataAccessException {
		em.persist(company);
	}

	@Override
	public void updateCompany(Company company) throws DataAccessException {
		em.merge(company);
	}



}
