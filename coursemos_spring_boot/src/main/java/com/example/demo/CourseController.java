package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/course/writeCourse")
public class CourseController {
	@GetMapping
	public String writeCourseForm() {
		return "course/writeCourse";
	}
	
	@PostMapping
	@ResponseBody
	public String writeCourse(@RequestBody String body) {
		System.out.println("Request Body: " + body);
		return body;
	}
}
