package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor 
public class Place {
	int placeId;
	String taste;
	String placeName;
	double x;
	double y;
	String subway;
}
