package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import com.example.demo.domain.Scrap;

public interface ScrapDao {
	List<Scrap> getAllScrap() throws DataAccessException;
	List<Scrap> getScrapByMemberId(Long memberId) throws DataAccessException;
	Scrap getScrapByPrimaryKey(Long memberId, Long courseId) throws DataAccessException;
	void insertScrap(Scrap scrap) throws DataAccessException;
	void deleteScrap(Scrap scrap) throws DataAccessException;
}
