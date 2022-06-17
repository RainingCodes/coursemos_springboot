package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.CourseLikeDao;
import com.example.demo.domain.CourseLike;
import com.example.demo.domain.CourseLikePK;

@Repository
public class JpaCourseLikeDao implements CourseLikeDao {
	@PersistenceContext
    private EntityManager em;

	@Override
	public List<CourseLike> getAllCourseLike() throws DataAccessException {
		TypedQuery<CourseLike> query = em.createQuery(
                "select c from CourseLike c", CourseLike.class);
        return query.getResultList();
	}

	@Override
	public List<CourseLike> getCourseLikeByMemberId(Long memberId) throws DataAccessException {
		TypedQuery<CourseLike> query = em.createQuery(
                "select c from CourseLike c " + "where c.memberId = ?1", CourseLike.class);
		query.setParameter(1, memberId);
        return query.getResultList();
	}

	@Override
	public CourseLike getCourseLikeByPrimaryKey(Long memberId, int courseId) throws DataAccessException {
		CourseLikePK pk = new CourseLikePK(memberId, courseId);
		return em.find(CourseLike.class, pk);
	}

	@Override
	public void insertScrap(CourseLike courseLike) throws DataAccessException {
		em.persist(courseLike);
	}

	@Override
	public void deleteScrap(CourseLike courseLike) throws DataAccessException {
		em.remove(courseLike);
	}
}
