package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.demo.domain.Course;
import com.example.demo.domain.TasteCategory;

@Service
public class SearchService {
	
	private int nextCourseId = 0;
	private Map<Integer, Course> courseMap = new HashMap<Integer, Course>();
	
	public SearchService() {
	}

	public List<Course> getCourseListbyPlace(String place1) {
		return new ArrayList<Course>(courseMap.values());
	}
	
	public List<String> getTasteCategory(TasteCategory tasteCate) {
		List<String> tList = new ArrayList<String>();
		tList.add("active");
		tList.add("calm");
		tList.add("healing");
		tList.add("nature");
		tList.add("official");
		tList.add("experience");
		tList.add("entertain");
		tList.add("retro");
		return tList;	
	}
	
	public List<Course> getCourseList() {
		List<Course> cList = new ArrayList<Course>();
		cList.add(new Course(nextCourseId, "서울시티투어", "서울의 전경을 한 눈에 볼 수 있는 코스로 자연 경관과 도시 경관 모두 볼 수 있습니다.", 240, 1, null, "healing"));
		//courseMap.put(nextCourseId, cList.get(nextCourseId));
		nextCourseId++;
		cList.add(new Course(nextCourseId, "방탈출 마스터", "강남 내 방탈출 카페 마스터가 되고 싶은 사람들 모여라", 300, 3, null, "entertain"));
		//courseMap.put(nextCourseId, cList.get(nextCourseId));
		nextCourseId++;
		cList.add(new Course(nextCourseId, "'카페투어'", "커피와 디저트를 좋아하는 사람을 위한 코스.", 120, 1, null, "calm"));
		//courseMap.put(nextCourseId, cList.get(nextCourseId));
		nextCourseId++;
		return cList;
	}
	
}
