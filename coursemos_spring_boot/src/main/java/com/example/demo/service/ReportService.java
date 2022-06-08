package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.Report;

public interface ReportService {
	List<Report> getAllCourseReport();
	List<Report> getAllReviewReport();
	void insertAccount(Report report);
	void updateAccount(Report report);
}
