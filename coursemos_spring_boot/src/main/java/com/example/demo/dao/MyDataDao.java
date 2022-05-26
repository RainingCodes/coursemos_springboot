package com.example.demo.dao;
import java.util.List;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Company;
import com.example.demo.domain.Coupon;
import com.example.demo.domain.Course;
import com.example.demo.domain.Report;
import com.example.demo.domain.Review;

public interface MyDataDao {
	List<Review> getReviewListByUserId(int userId) throws DataAccessException;
	List<Course> getCourseListByUserId(int userId) throws DataAccessException;
	List<Course> getCourseLikeListByUserId(int userId) throws DataAccessException;
	List<Course> getScrapListByUserId(int userId) throws DataAccessException;
	List<Review> getReviewLikeListByUserId(int userId) throws DataAccessException;
	List<Report> getReportListByUserId(int userId) throws DataAccessException;
	List<Company> getCompanyListByUserId(int userId) throws DataAccessException;
}
