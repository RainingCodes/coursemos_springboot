package dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Report;

public interface ReportDao {
	List<Report> getReportByReportId(int reportId) throws DataAccessException;
	int updateReportState(int reportId) throws DataAccessException;
	void insertReport(Report report) throws DataAccessException;
}
