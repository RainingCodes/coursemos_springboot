package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.TasteCategory;

public interface TasteCategoryDao {

	List<TasteCategory> getCategoryList() throws DataAccessException;

	TasteCategory getCategory(String categoryId) throws DataAccessException;

}
