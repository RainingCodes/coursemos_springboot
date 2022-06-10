package com.example.demo.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.TasteCategory;

public interface TasteService {
	List<TasteCategory> getCategory() throws DataAccessException;

}
