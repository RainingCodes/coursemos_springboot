package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CompanyDao;
import com.example.demo.domain.Company;
import com.example.demo.repository.CompanyRepository;

@Service("CompanyServiceImpl")
@Transactional
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired 
	@Qualifier("jpaCompanyDao")
	private CompanyDao companyDao;
	@Autowired
	private CompanyRepository companyRepository;

	@Override
	public List<Company> getAllCompany() {
		return companyDao.getAllCompany();
	}

	@Override
	public List<Company> getCompanyByMemberId(Long memberId) {
		return companyDao.getCompanyByMemberId(memberId);
	}
	

	@Override
	public Company getCompanyByPlaceId(Integer placeId) {
		return companyRepository.findCompanyByPlacePlaceId(placeId);
	}

	@Override
	public Company getCompanyByCompanyId(Long companyId) {
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

	@Override
	public void deleteCompany(Company company) {
		companyDao.deleteCompany(company);
		
	}


}
