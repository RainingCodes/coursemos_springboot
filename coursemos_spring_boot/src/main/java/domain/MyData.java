package domain;

import java.util.List;
import java.io.Serializable;

@SuppressWarnings("serial")
public class MyData implements Serializable {
	List<Review> myReviews;
	List<Course> myCourses;
	List<Course> scrap;
	List<Course> courseLike;
	List<Review> reviewLike;
	List<Report> myReports;
	List<Company> myCompanies;
	public List<Review> getMyReviews() {
		return myReviews;
	}
	public void setMyReviews(List<Review> myReviews) {
		this.myReviews = myReviews;
	}
	public List<Course> getMyCourses() {
		return myCourses;
	}
	public void setMyCourses(List<Course> myCourses) {
		this.myCourses = myCourses;
	}
	public List<Course> getScrap() {
		return scrap;
	}
	public void setScrap(List<Course> scrap) {
		this.scrap = scrap;
	}
	public List<Course> getCourseLike() {
		return courseLike;
	}
	public void setCourseLike(List<Course> courseLike) {
		this.courseLike = courseLike;
	}
	public List<Review> getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(List<Review> reviewLike) {
		this.reviewLike = reviewLike;
	}
	public List<Report> getMyReports() {
		return myReports;
	}
	public void setMyReports(List<Report> myReports) {
		this.myReports = myReports;
	}
	public List<Company> getMyCompanies() {
		return myCompanies;
	}
	public void setMyCompanies(List<Company> myCompanies) {
		this.myCompanies = myCompanies;
	}
	
	public MyData() {
		
	}
	

}
