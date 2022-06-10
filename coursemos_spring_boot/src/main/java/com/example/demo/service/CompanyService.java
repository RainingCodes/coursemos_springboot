package com.example.demo.service;

import java.util.List;
import com.example.demo.domain.Company;

public interface CompanyService {
	List<Company> getAllCompany();
	List<Company> getCompanyByUserId(int userId);
	Company getCompanyByCompanyId(int companyId);
	void updateCompany(Company company);
	void insertCompany(Company company);
}
