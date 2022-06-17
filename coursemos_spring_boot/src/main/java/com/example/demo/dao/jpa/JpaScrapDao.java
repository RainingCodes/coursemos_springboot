package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.ScrapDao;
import com.example.demo.domain.Scrap;
import com.example.demo.domain.ScrapPK;

@Repository
public class JpaScrapDao implements ScrapDao {
	@PersistenceContext
    private EntityManager em;

	@Override
	public List<Scrap> getAllScrap() throws DataAccessException {
		TypedQuery<Scrap> query = em.createQuery(
                "select s from Scrap s", Scrap.class);
        return query.getResultList();
	}

	@Override
	public List<Scrap> getScrapByMemberId(Long memberId) throws DataAccessException { 
		TypedQuery<Scrap> query = em.createQuery(
                "select s from Scrap s " + "where s.memberId = ?1", Scrap.class);
		query.setParameter(1, memberId);
        return query.getResultList();
	}
	
	@Override
	public Scrap getScrapByPrimaryKey(Long memberId, int courseId) throws DataAccessException {
		ScrapPK pk = new ScrapPK(memberId, courseId);
		return em.find(Scrap.class, pk);
	}	

	@Override
	public void insertScrap(Scrap scrap) throws DataAccessException {
		em.persist(scrap);
	}

	@Override
	public void deleteScrap(Scrap scrap) throws DataAccessException {
		em.remove(scrap);
	}

	

}
