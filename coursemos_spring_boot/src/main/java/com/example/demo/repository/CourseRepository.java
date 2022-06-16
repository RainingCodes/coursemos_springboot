package com.example.demo.repository;

import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.domain.Course;

public interface CourseRepository extends CrudRepository<Course, Integer> {
	
	
	
	static Page<Course> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	List<Course> findCourseListByMemberId(Long memberId);
	
}



