package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.domain.Points;

public interface PointsRepository extends CrudRepository<Points, String>{

	List<Points> findAllByMemberId(Long memberId);

}
