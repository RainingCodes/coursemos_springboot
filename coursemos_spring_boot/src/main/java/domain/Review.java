package domain;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Review implements Serializable {

	private int reviewId;
	private String reviewContents;
	private String photos;
	private Date writtenDate;
	private int likes;
	private int userId;
	
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Review(String reviewContents, String photos, Date writtenDate, int userId) {
		super();
		this.reviewContents = reviewContents;
		this.photos = photos;
		this.writtenDate = writtenDate;
		likes = 0;
		this.userId = userId;
	}
	
	public Review(String reviewContents, Date writtenDate, int userId) {
		super();
		this.reviewContents = reviewContents;
		this.photos = null;
		this.writtenDate = writtenDate;
		likes = 0;
		this.userId = userId;
	}

}
