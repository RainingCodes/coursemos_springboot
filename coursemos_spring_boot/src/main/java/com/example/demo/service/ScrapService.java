package com.example.demo.service;

import java.util.List;
import com.example.demo.domain.Scrap;

public interface ScrapService {
	List<Scrap> getAllScrap();
	List<Scrap> getScrapByMemberId(Long memberId);
	Scrap getScrapByPrimaryKey(Long memberId, Long courseId);
	void insertScrap(Scrap scrap);
	void deleteScrap(Scrap scrap);
}
