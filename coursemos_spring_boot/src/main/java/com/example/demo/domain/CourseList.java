package com.example.demo.domain;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.support.PagedListHolder;

@SuppressWarnings("serial")
public class CourseList implements Serializable {

	  /* Private Fields */

	  private final Map<String, Course> courseMap = Collections.synchronizedMap(new HashMap<String, Course>());
		
	  private final PagedListHolder<Course> courseList = new PagedListHolder<Course>();

	  /* JavaBeans Properties */

	  public CourseList() {
		this.courseList.setPageSize(4);
	  }

	  public Iterator<Course> getAllCourseItems() { return courseList.getSource().iterator(); }
	  public PagedListHolder<Course> getCourseList() { return courseList; }
	  public int getNumberOfItems() { return courseList.getSource().size(); }

}
