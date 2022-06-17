package com.example.demo.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.support.JdbcUtils;
import org.springframework.jdbc.support.SQLExceptionTranslator;
import org.springframework.jdbc.support.SQLStateSQLExceptionTranslator;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.demo.domain.Course;
import com.example.demo.domain.TasteCategory;

public interface SearchService {
	Course getCourseByCourseId(int courseId) throws DataAccessException;
	
	
	void insertCourse(Course course) throws DataAccessException;
	
	List<Course> searchCourseListByPlace(String place) throws DataAccessException;

	List<Course> getCourseListByTaste(String taste) throws DataAccessException;
	
	List<Course> getCourseListByTaste(String taste, String subway) throws DataAccessException;

	List<Course> getCourseListByLike(int like) throws DataAccessException;

	List<Course> getCourseListByTime(int time) throws DataAccessException;

	List<Course> searchCourseListByKeyword(String keyword) throws DataAccessException;

	List<Course> searchCourseListByPlace(String place1, String place2) throws DataAccessException;

	List<Course> getCourseListByTaste(String place1, String place2, String taste) throws DataAccessException;

	List<Course> getCourseListByLike(String place1, String place2) throws DataAccessException;

	List<Course> getCourseListByTime(String place1, String place2) throws DataAccessException;

	List<Course> getCourseList(String station) throws DataAccessException;
	
	Page<Course> getCoursePageList(Pageable pageable) throws DataAccessException;


	
	/*private SQLExceptionTranslator exceptionTranslator = new SQLStateSQLExceptionTranslator();
	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	private static final String SELECT_COURSE_LIST_SQL = "select * from course";
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

	
	public List<Course> getCourseList(double x, double y, String station) {
		String[] coorArr = {"37.577552,126.976869", "37.551245,126.988216", "37.522470,126.939713"};
		
		Date date = new Date();
		List<Course> cList = new ArrayList<Course>();
		return cList; */
		/*
		cList.add(new Course(nextCourseId, "서울시티투어", "서울의 전경을 한 눈에 볼 수 있는 코스로 자연 경관과 도시 경관 모두 볼 수 있습니다.", coorArr, 240, 1, "healing", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 2, date));
		nextCourseId++;
		cList.add(new Course(nextCourseId, "방탈출 마스터", "강남 내 방탈출 카페 마스터가 되고 싶은 사람들 모여라", coorArr, 300, 3, "entertain", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 3, date));
		nextCourseId++;
		cList.add(new Course(nextCourseId, "'카페투어'", "커피와 디저트를 좋아하는 사람을 위한 코스.", coorArr, 120, 1, "calm", "https://dummyimage.com/500x500/ced4da/6c757d.jpg", 4, date ));
		nextCourseId++;
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DataSourceUtils.getConnection(dataSource);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_COURSE_LIST_SQL);
			if (rs.next()) {
				List<Course> cList = new ArrayList<Course>();
				do {
					Course course = new Course();
					course.setCourseId(rs.getInt("COURSEID"));
					course.setCourseName(rs.getString("COURSENAME"));
					course.setCourseContents(rs.getString("COURSECONTENTS"));
					course.setMemberId(rs.getInt("MEMBERID"));
					course.setTaste(rs.getString("TASTE"));
					course.setLikes(rs.getInt("LIKES"));
					course.setWrittenDate(rs.getDate("WRITTENDATE"));
					course.setPlace1(rs.getInt("PLACE1"));
					course.setPlace2(rs.getInt("PLACE2"));
					course.setPlace3(rs.getInt("PLACE3"));
					cList.add(course);
				} while (rs.next());
				
				return cList;
			} else {
				return Collections.emptyList();
			}
		} catch (SQLException e) {
			throw exceptionTranslator.translate("getCourseList", SELECT_COURSE_LIST_SQL, e);
		} finally {
			JdbcUtils.closeResultSet(rs);
			JdbcUtils.closeStatement(stmt);
			DataSourceUtils.releaseConnection(conn, dataSource);
			
		}
		
	}*/

	
}
