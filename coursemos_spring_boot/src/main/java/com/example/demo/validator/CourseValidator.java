package com.example.demo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.domain.Course;

public class CourseValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Course.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Course course = (Course) target;
		
		if (course.getCourseName() == null || course.getCourseName().trim().isEmpty())
			errors.rejectValue("courseName", "required");
		if (course.getCourseContents() == null || course.getCourseContents().trim().isEmpty())
			errors.rejectValue("courseContents", "required");
		if(course.getTaste() == null || course.getTaste().trim().isEmpty())
			errors.rejectValue("taste", "required");
	}
}
