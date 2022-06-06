package com.example.demo.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


import org.springframework.data.annotation.Id;
import org.springframework.web.bind.annotation.ModelAttribute;

import lombok.Getter;
import lombok.Setter;



//import com.example.dto.OAuthAttributes.OAuthAttributesBuilder;


//@Entity
@SuppressWarnings("serial")
//@SecondaryTable(name="MYREVIEWS", pkJoinColumns=@PrimaryKeyJoinColumn(
//		name="memberId", referencedColumnName="memberId"))
//@SecondaryTable(name="MYCOURSES", pkJoinColumns=@PrimaryKeyJoinColumn(
//		name="memberId", referencedColumnName="memberId"))
//public class Member extends BaseEntity implements Serializable {
public class Member  implements Serializable {
  /* Private Fields */

  @Id @Getter @Setter
  private Long id;
  
  @Column(nullable=false, unique=true) @Getter @Setter
  private String nickName;
  
  @Column(nullable=false) @Getter @Setter
  private String password;
  
  @Column(nullable = false) @Getter @Setter
  private int genderCode;
  
  
  @Temporal(TemporalType.DATE) @Getter @Setter
  @Column(nullable = false)
  private Date birth;
  
  @Column() @Getter @Setter
  private String tasteCode;
  
  @Transient @Getter @Setter
  private int point;
  
  //@Transient
  //@Embedded @Getter @Setter
  //private MyData myData;
  
  @Transient
  private Role role;

  /* JavaBeans Properties */

  
  public Member() {
	  super();
	  this.nickName = "";
	  this.password = "";
	  this.genderCode = 0;
	  this.birth = new Date(System.currentTimeMillis());
	  this.tasteCode = null;
	  this.point = 20;
	  this.role = Role.USER;
	  //this.myData = new MyData();
  }
//public Member(String nickName, int gender, String birth, String userName, String taste, Role role) {
//		super();
//		this.nickName = nickName;
//		this.gender = gender;
//		this.birth = birth;
//		this.userName = userName;
//		this.taste = taste;
//		this.role = role;
//	}

	
}
