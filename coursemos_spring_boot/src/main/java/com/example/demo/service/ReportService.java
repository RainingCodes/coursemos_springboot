package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.Report;

public interface ReportService {
	List<Report> getAllCourseReport();
	List<Report> getAllReviewReport();
	Report getReportById(int reportId);
	void insertReport(Report report);
	void updateReport(Report report);
}
