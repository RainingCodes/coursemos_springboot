package com.example.demo.service;

import java.util.ArrayList;
import java.util.Date;
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
		tList.add("experience");
		tList.add("entertain");
		tList.add("retro");
		return tList;	
	}
	
//	public List<Course> getCourseList() {
//		String[] coorArr = {"37.577552,126.976869", "37.551245,126.988216", "37.522470,126.939713"};
//		Date date = new Date();
//		List<Course> cList = new ArrayList<Course>();
//		cList.add(new Course(nextCourseId, "서울시티투어", "서울의 전경을 한 눈에 볼 수 있는 코스로 자연 경관과 도시 경관 모두 볼 수 있습니다.", coorArr, 240, 1, "healing", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 2, date));
//		//courseMap.put(nextCourseId, cList.get(nextCourseId));
//		nextCourseId++;
//		cList.add(new Course(nextCourseId, "방탈출 마스터", "강남 내 방탈출 카페 마스터가 되고 싶은 사람들 모여라", coorArr, 300, 3, "entertain", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 3, date));
//		//courseMap.put(nextCourseId, cList.get(nextCourseId));
//		nextCourseId++;
//		cList.add(new Course(nextCourseId, "'카페투어'", "커피와 디저트를 좋아하는 사람을 위한 코스.", coorArr, 120, 1, "calm", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 4, date ));
//		//courseMap.put(nextCourseId, cList.get(nextCourseId));
//		nextCourseId++;
//		return cList;
//	}
	
	public List<Course> getCourseList(double x, double y, String station) {
		String[] coorArr = {"37.577552,126.976869", "37.551245,126.988216", "37.522470,126.939713"};
		
		Date date = new Date();
		List<Course> cList = new ArrayList<Course>();
		cList.add(new Course(nextCourseId, "서울시티투어", "서울의 전경을 한 눈에 볼 수 있는 코스로 자연 경관과 도시 경관 모두 볼 수 있습니다.", coorArr, 240, 1, "healing", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 2, date));
		nextCourseId++;
		cList.add(new Course(nextCourseId, "방탈출 마스터", "강남 내 방탈출 카페 마스터가 되고 싶은 사람들 모여라", coorArr, 300, 3, "entertain", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 3, date));
		nextCourseId++;
		cList.add(new Course(nextCourseId, "'카페투어'", "커피와 디저트를 좋아하는 사람을 위한 코스.", coorArr, 120, 1, "calm", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 4, date ));
		nextCourseId++;
		
		return cList;
	}

	
}
