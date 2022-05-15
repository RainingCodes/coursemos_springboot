package dao;
import domain.User;

import org.springframework.dao.DataAccessException;
public interface UserDao {

	  User getUser(int userId) throws DataAccessException;

	  void insertUser(User user) throws DataAccessException;

	  void updateUser(User user) throws DataAccessException;
	  
	  void deleteUser(User user) throws DataAccessException;

}