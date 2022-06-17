package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import com.example.demo.domain.Company;

public interface CompanyDao {
	List<Company> getAllCompany() throws DataAccessException;
	List<Company> getCompanyByMemberId(Long memberId) throws DataAccessException;
	Company getCompanyByPlaceId(Long placeId) throws DataAccessException;
	Company getCompanyByCompanyId(Long companyId) throws DataAccessException;
	void updateCompany(Company company) throws DataAccessException;
	void insertCompany(Company company) throws DataAccessException;
	void deleteCompany(Company company) throws DataAccessException;
}