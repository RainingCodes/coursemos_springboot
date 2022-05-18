package com.example.demo;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@RestController
@RequestMapping("/course")
public class SearchPlaceController {
	@GetMapping("/search")
	public ModelAndView searchPlaceForm() {
		
		ModelAndView mav = new ModelAndView("search"); // view 이름: "hello" 
		return mav;
	}
	@PostMapping("/serach")
	public ModelAndView submit() {
		ModelAndView mav = new ModelAndView("searchResult"); // view 이름: "hello"      
	   return mav;   
	}
}
