package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReportDao;
import com.example.demo.domain.Report;

@Service("reportServiceImpl")
@Transactional
public class ReportServiceImpl implements ReportService {
	
	@Autowired 
	@Qualifier("jpaReportDao")
	private ReportDao reportDao;
	
	@Override
	public void insertReport(Report report) {
		reportDao.insertReport(report);		
	}

	@Override
	public void updateReport(Report report) {
		reportDao.updateReport(report);
	}

	@Override
	public List<Report> getAllCourseReport() {
		return reportDao.getAllCourseReport();
	}

	@Override
	public List<Report> getAllReviewReport() {
		return reportDao.getAllReviewReport();
	}

	@Override
	public Report getReportById(int reportId) {
		return reportDao.getReportById(reportId);
	}
	
	

}
