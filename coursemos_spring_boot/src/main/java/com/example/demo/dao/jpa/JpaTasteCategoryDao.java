package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.TasteCategoryDao;
import com.example.demo.domain.Report;
import com.example.demo.domain.TasteCategory;

@Repository
public class JpaTasteCategoryDao implements TasteCategoryDao {

	@PersistenceContext
    private EntityManager em;


	@Override
	public List<TasteCategory> getCategory() throws DataAccessException {
		TypedQuery<TasteCategory> query = em.createQuery(
                "select t from TasteCategory t", TasteCategory.class);
        return query.getResultList();
	}

}
