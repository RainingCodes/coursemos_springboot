package com.example.demo.dao;
import org.springframework.dao.DataAccessException;

import com.example.demo.domain.Member;
public interface MemberDao {

	  Member getUser(int userId) throws DataAccessException;

	  void insertUser(Member user) throws DataAccessException;

	  void updateUser(Member user) throws DataAccessException;
	  
	  void deleteUser(Member user) throws DataAccessException;

}