package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ScrapDao;
import com.example.demo.domain.Scrap;

@Service("ScrapServiceImpl")
@Transactional
public class ScrapServiceImpl implements ScrapService {
	
	@Autowired 
	@Qualifier("jpaScrapDao")
	private ScrapDao scrapDao;

	@Override
	public List<Scrap> getAllScrap() {
		return scrapDao.getAllScrap();
	}

	@Override
	public List<Scrap> getScrapByMemberId(Long memberId) {
		return  scrapDao.getScrapByMemberId(memberId);
	}


	@Override
	public void insertScrap(Scrap scrap) {
		scrapDao.insertScrap(scrap);
	}

	@Override
	public void deleteScrap(Scrap scrap) {
		scrapDao.deleteScrap(scrap);
	}

	@Override
	public Scrap getScrapByPrimaryKey(Long memberId, int courseId) {
		// TODO Auto-generated method stub
		return scrapDao.getScrapByPrimaryKey(memberId, courseId);
	}


}
