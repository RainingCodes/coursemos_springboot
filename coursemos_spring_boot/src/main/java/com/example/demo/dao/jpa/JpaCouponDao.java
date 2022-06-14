package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.CouponDao;
import com.example.demo.domain.Coupon;

@Repository
public class JpaCouponDao implements CouponDao {
	@PersistenceContext
    private EntityManager em;

	@Override
	public List<Coupon> getCouponByCompanyId(Long companyId) throws DataAccessException {
		TypedQuery<Coupon> query = em.createQuery(
                "select c from Coupon c " + "where c.companyId = ?1", Coupon.class);
		query.setParameter(1, companyId);
        return query.getResultList();
	}
	
	@Override
	public Coupon getCouponByCouponId(int couponId) throws DataAccessException {
		return em.find(Coupon.class, couponId);
	}

	@Override
	public void deleteCoupon(Coupon coupon) throws DataAccessException {
		em.remove(coupon);		
	}

	@Override
	public void updateCoupon(Coupon coupon) throws DataAccessException {
		em.merge(coupon);
	}

	@Override
	public void insertCoupon(Coupon coupon) throws DataAccessException {
		em.persist(coupon);
	}

}
