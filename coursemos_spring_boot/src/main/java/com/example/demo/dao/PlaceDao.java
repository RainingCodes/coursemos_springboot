package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Place;

public interface PlaceDao {
	List<Place> getAllPlace() throws DataAccessException;
	Place getPlaceByPlaceId(int placeId) throws DataAccessException;
	void updatePlace(Place place) throws DataAccessException;
	void insertPlace(Place place) throws DataAccessException;
	void deletePlace(Place place) throws DataAccessException;
}
