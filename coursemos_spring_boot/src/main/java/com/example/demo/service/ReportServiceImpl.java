package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReportDao;
import com.example.demo.domain.Report;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService {
	
	@Autowired 
	@Qualifier("jpaReportDao")
	private ReportDao reportDao;

	@Override
	public List<Report> getAllReport() {
		return reportDao.getAllReport();
	}

	@Override
	public void insertAccount(Report report) {
		reportDao.insertReport(report);		
	}

	@Override
	public void updateAccount(Report report) {
		reportDao.updateReport(report);
	}
	
	

}
