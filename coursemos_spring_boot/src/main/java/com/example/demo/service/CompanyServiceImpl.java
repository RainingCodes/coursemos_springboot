package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CompanyDao;
import com.example.demo.domain.Company;

@Service("CompanyServiceImpl")
@Transactional
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired 
	@Qualifier("jpaCompanyDao")
	private CompanyDao companyDao;

	@Override
	public List<Company> getAllCompany() {
		return companyDao.getAllCompany();
	}

	@Override
	public List<Company> getCompanyByUserId(int userId) {
		return companyDao.getCompanyByUserId(userId);
	}

	@Override
	public Company getCompanyByCompanyId(int companyId) {
		return companyDao.getCompanyByCompanyId(companyId);
	}

	@Override
	public void updateCompany(Company company) {
		companyDao.updateCompany(company);
	}

	@Override
	public void insertCompany(Company company) {
		companyDao.insertCompany(company);
	}

}