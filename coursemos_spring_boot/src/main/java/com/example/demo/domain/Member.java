package com.example.demo.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



//import com.example.dto.OAuthAttributes.OAuthAttributesBuilder;


@Entity
@ToString(exclude = "password")
@SuppressWarnings("serial")
//@SecondaryTable(name="MYREVIEWS", pkJoinColumns=@PrimaryKeyJoinColumn(
//		name="memberId", referencedColumnName="memberId"))
//@SecondaryTable(name="MYCOURSES", pkJoinColumns=@PrimaryKeyJoinColumn(
//		name="memberId", referencedColumnName="memberId"))
//public class Member extends BaseEntity implements Serializable {
public class Member  implements Serializable {
  /* Private Fields */

  @Id @Column(name="memberId") @Getter @Setter 
  private Long id;
  
  @Column(nullable=false, unique=true) @Getter @Setter 
  private String nickName;
  
  
  @Column(nullable=false) @Setter @Getter
  private String password;
  
  @Column(nullable=false) @Getter @Setter
  private Character type;
  
  @Column(nullable=false, name="gender") @Getter @Setter
  private Integer genderCode;
  
  @Getter @Setter
  @Column(nullable = false)
  private Date birth;
  
  @Column(name="taste") @Getter @Setter
  private String tasteCode;
  
  @Transient @Getter @Setter
  private int point;
  
  //@Transient
  //@Embedded @Getter @Setter
  private MyData myData;
  

  /* JavaBeans Properties */

  
  public Member() {
	  super();
	  this.nickName = null;
	  this.password = null;
	  this.genderCode = null;
	  this.birth = new Date(System.currentTimeMillis());
	  this.type = 'E';
	  this.tasteCode = null;
	  this.point = 20;
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
