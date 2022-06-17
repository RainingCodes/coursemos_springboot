package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.domain.Company;

public interface CompanyRepository extends JpaRepository<Company, Long> {
	Company findCompanyByPlacePlaceId(Integer placeId);
}
