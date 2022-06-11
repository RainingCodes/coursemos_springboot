package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.PlaceDao;
import com.example.demo.domain.Place;

@Service("PlaceServiceImpl")
@Transactional
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired 
	@Qualifier("jpaPlaceDao")
	private PlaceDao placeDao;

	@Override
	public List<Place> getAllPlace() {
		return placeDao.getAllPlace();
	}

	@Override
	public Place getPlaceByPlaceId(int placeId) {
		return placeDao.getPlaceByPlaceId(placeId);
	}

	@Override
	public void updatePlace(Place place) {
		placeDao.updatePlace(place);
	}

	@Override
	public void insertPlace(Place place) {
		placeDao.insertPlace(place);
	}

	@Override
	public void deletePlace(Place place) {
		placeDao.deletePlace(place);
	}

}
