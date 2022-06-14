package com.example.demo.service;

import java.util.List;
import com.example.demo.domain.Company;

public interface CompanyService {
	List<Company> getAllCompany();
	List<Company> getCompanyByMemberId(int memberId);
	Company getCompanyByCompanyId(Long companyId);
	void updateCompany(Company company);
	void insertCompany(Company company);
	void deleteCompany(Company company);
}
