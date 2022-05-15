package dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.coursemos.domain.Company;

public interface CompanyDao {
	List<Company> getCompanyByUserId(int userId) throws DataAccessException;
	Company getCompanyByCompanyId(int companyId) throws DataAccessException;
	int updateCompanyAccept(int compnayId) throws DataAccessException;
	void insertCompany(Company company) throws DataAccessException;
}