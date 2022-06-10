package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.TasteCategoryDao;
import com.example.demo.domain.TasteCategory;

@Service("TasteServiceImpl")
@Transactional
public class TasteServiceImpl  implements TasteService {
	@Autowired 
	@Qualifier("jpaTasteCategoryDao")
	TasteCategoryDao tasteCategoryDao;

	@Override
	public List<TasteCategory> getCategory() throws DataAccessException {
		// TODO Auto-generated method stub
		return tasteCategoryDao.getCategory();
	}
}
