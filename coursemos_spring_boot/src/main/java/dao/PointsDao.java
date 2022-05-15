package dao;
import java.util.List;
import org.springframework.dao.DataAccessException;
import com.example.coursemos.domain.Points;

public interface PointsDao {
	List<Points> getPointListByUserId(int userId) throws DataAccessException;
	void insertPoints(Points points) throws DataAccessException;
	void usePoints(Points points) throws DataAccessException;
}
