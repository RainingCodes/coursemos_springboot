package com.example.demo.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.domain.Course;

public interface CourseRepository extends CrudRepository<Course, Integer> {
	
	List<Course> findBycourseId(int courseId, Sort sort);
	List<Course> findCourseListByMemberId(Long memberId);
	Page<Course> findAll(Pageable pageable);
	Page<Course> findByPlace1Subway(String subway, Pageable pageable);
	@Query(value="select c from Course c where c.taste = :taste")
	Page<Course> findCourse1(@Param("taste")String taste, Pageable pageable);
	@Query(value="select c from Course c where c.place1.subway = :subway and c.taste = :taste")
	Page<Course> findCourse2(@Param("subway")String subway, @Param("taste")String taste, Pageable pageable);	
}


