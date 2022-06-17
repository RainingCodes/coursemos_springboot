package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.Report;

public interface ReportService {
	List<Report> getAllCourseReport();
	List<Report> getAllReviewReport();
	Report getReportById(int reportId);
	List<Report> getReportByMemberId(Long memberId);
	void insertReport(Report report);
	void updateReport(Report report);
}
