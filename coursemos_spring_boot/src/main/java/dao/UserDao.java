package dao;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.User;
public interface UserDao {

	  User getUser(int userId) throws DataAccessException;

	  void insertUser(User user) throws DataAccessException;

	  void updateUser(User user) throws DataAccessException;
	  
	  void deleteUser(User user) throws DataAccessException;

}