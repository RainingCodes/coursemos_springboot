package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ScrapDao;
import com.example.demo.domain.Scrap;

@Service("PlaceServiceImpl")
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
	public List<Scrap> getScrapByMemberIdAndCourseId(Long memberId, Long courseId) {
		return scrapDao.getScrapByMemberIdAndCourseId(memberId, courseId);
	}

	@Override
	public int existScrap(Long memberId, Long courseId) {
		List<Scrap> list = scrapDao.getScrapByMemberIdAndCourseId(memberId, courseId);
		return list.size();
	}

	@Override
	public void insertScrap(Scrap scrap) {
		scrapDao.insertScrap(scrap);
	}

	@Override
	public void deleteScrap(Scrap scrap) {
		scrapDao.deleteScrap(scrap);
	}

}
