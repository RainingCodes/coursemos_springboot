package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/course")
public class SearchPlaceController {
	@GetMapping("/search")
	public String Form() {
		return "search/searchPlace";
	}
}
