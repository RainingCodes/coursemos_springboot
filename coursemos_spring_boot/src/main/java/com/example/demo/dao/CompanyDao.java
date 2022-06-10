package com.example.demo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.repository.query.Param;

import com.example.demo.domain.Company;

public interface CompanyDao {
	List<Company> getAllCompany() throws DataAccessException;
	List<Company> getCompanyByMemberId(int memberId) throws DataAccessException;
	Company getCompanyByCompanyId(int companyId) throws DataAccessException;
	void updateCompany(Company company) throws DataAccessException;
	void insertCompany(Company company) throws DataAccessException;
}