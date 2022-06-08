package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Report;

public interface ReportDao {
	List<Report> getAllReviewReport() throws DataAccessException;
	void updateReport(Report report) throws DataAccessException;
	void insertReport(Report report) throws DataAccessException;
	List<Report> getAllCourseReport() throws DataAccessException;
}
