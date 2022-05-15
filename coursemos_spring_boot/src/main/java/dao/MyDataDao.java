package dao;
import java.util.List;
import org.springframework.dao.DataAccessException;

import domain.Review;
import domain.Course;
import domain.Report;
import domain.Company;
import domain.Coupon;

public interface MyDataDao {
	List<Review> getReviewListByUserId(int userId) throws DataAccessException;
	List<Course> getCourseListByUserId(int userId) throws DataAccessException;
	List<Course> getCourseLikeListByUserId(int userId) throws DataAccessException;
	List<Course> getScrapListByUserId(int userId) throws DataAccessException;
	List<Review> getReviewLikeListByUserId(int userId) throws DataAccessException;
	List<Report> getReportListByUserId(int userId) throws DataAccessException;
	List<Company> getCompanyListByUserId(int userId) throws DataAccessException;
}
