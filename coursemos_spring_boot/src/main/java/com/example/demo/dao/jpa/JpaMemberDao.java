package com.example.demo.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Member;
@Repository
public class JpaMemberDao {
	@PersistenceContext
	private EntityManager em; 
	
	public Member insertMember(Member member) throws DataAccessException {
		em.persist(member);
		return member;
	}

	public void updateMember(Member member) throws DataAccessException {
		em.merge(member);
	}
	
}
