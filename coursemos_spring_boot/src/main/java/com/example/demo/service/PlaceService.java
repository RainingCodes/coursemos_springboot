package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.Place;

public interface PlaceService {
	List<Place> getAllPlace();
	Place getPlaceByPlaceId(int placeId);
	void updatePlace(Place place);
	void insertPlace(Place place);
	void deletePlace(Place place);
}
