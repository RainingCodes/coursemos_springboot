package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.Points;
import com.example.demo.repository.PointsRepository;

@Service
@Transactional
public class PointsService {
	@Autowired
	private PointsRepository pointsRepository;
	
	public void insertPoints(Points points) {
		pointsRepository.save(points);
	}
	public List<Points> findAllByMemberId(Long memberId) {
		return pointsRepository.findAllByMemberId(memberId);
	}
	public void delete(Points p) {
		// TODO Auto-generated method stub
		pointsRepository.delete(p);
	}
}
