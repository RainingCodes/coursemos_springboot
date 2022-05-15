package dao;
import java.util.List;
import org.springframework.dao.DataAccessException;
import com.example.coursemos.domain.Review;

public interface ReviewDao {
	Review getReviewByReviewId(int reviewId) throws DataAccessException;
	List<Review> getReviewListByCourseId(int courseId) throws DataAccessException;

	void insertReview(Review Review) throws DataAccessException;
	void updateReview(Review Review) throws DataAccessException;
	void deleteReview(Review Review) throws DataAccessException;
}
