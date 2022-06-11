package com.example.demo.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.PlaceDao;
import com.example.demo.domain.Place;

@Repository
public class JpaPlaceDao implements PlaceDao {
	@PersistenceContext
    private EntityManager em;

	@Override
	public List<Place> getAllPlace() throws DataAccessException {
		TypedQuery<Place> query = em.createQuery(
                "select p from Place p", Place.class);
        return query.getResultList();
	}

	@Override
	public Place getPlaceByPlaceId(int placeId) throws DataAccessException {
		return em.find(Place.class, placeId);
	}

	@Override
	public void updatePlace(Place place) throws DataAccessException {
		em.merge(place);
	}

	@Override
	public void insertPlace(Place place) throws DataAccessException {
		em.persist(place);
	}

	@Override
	public void deletePlace(Place place) throws DataAccessException {
		em.remove(place);
	}

}
