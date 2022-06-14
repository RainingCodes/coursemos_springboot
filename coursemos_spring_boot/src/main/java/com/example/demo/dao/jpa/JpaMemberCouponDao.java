package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.MemberCouponDao;
import com.example.demo.domain.MemberCoupon;

@Repository
public class JpaMemberCouponDao implements MemberCouponDao {
	@PersistenceContext
    private EntityManager em;

	@Override
	public List<MemberCoupon> getMemberCouponByMemberId(int memberId) throws DataAccessException {
		TypedQuery<MemberCoupon> query = em.createQuery(
                "select c from MemberCoupon c " + "where c.memberId = ?1", MemberCoupon.class);
		query.setParameter(1, memberId);
        return query.getResultList();
	}

	@Override
	public List<MemberCoupon> getMemberCouponByCouponId(int couponId) throws DataAccessException {
		TypedQuery<MemberCoupon> query = em.createQuery(
                "select c from MemberCoupon c " + "where c.couponId = ?1", MemberCoupon.class);
		query.setParameter(1, couponId);
        return query.getResultList();
	}

	@Override
	public MemberCoupon getMemberCouponByMemberCouponId(int MemberCouponId) throws DataAccessException {
		return em.find(MemberCoupon.class, MemberCouponId);
	}

	@Override
	public void updateMemberCoupon(MemberCoupon memberCoupon) throws DataAccessException {
		em.merge(memberCoupon);
	}

	@Override
	public void insertMemberCoupon(MemberCoupon memberCoupon) throws DataAccessException {
		em.persist(memberCoupon);
	}

}
