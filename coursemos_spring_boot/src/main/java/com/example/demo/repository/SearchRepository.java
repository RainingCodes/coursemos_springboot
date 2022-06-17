package com.example.demo.repository;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import com.example.demo.domain.Course;


public interface SearchRepository extends Repository<Course, Integer> {

	//Page<Course> findAll(Pageable pageable);
	List<Course> findByCourseId(int courseId);
    
}
