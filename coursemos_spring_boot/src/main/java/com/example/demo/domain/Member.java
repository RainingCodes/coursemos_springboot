package com.example.demo.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Transient;
import javax.persistence.ForeignKey;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SequenceGenerator;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



//import com.example.dto.OAuthAttributes.OAuthAttributesBuilder;


@Entity
@ToString(exclude = "password")
@SequenceGenerator(
		  name = "MEMBER_SEQ_GENERATOR", 
		  sequenceName = "MEMBER_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)
@SuppressWarnings("serial")
//@SecondaryTable(name="MYREVIEWS", pkJoinColumns=@PrimaryKeyJoinColumn(
//		name="memberId", referencedColumnName="memberId"))
//@SecondaryTable(name="MYCOURSES", pkJoinColumns=@PrimaryKeyJoinColumn(
//		name="memberId", referencedColumnName="memberId"))
//public class Member extends BaseEntity implements Serializable {
public class Member  implements Serializable {
  /* Private Fields */
		
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBER_SEQ_GENERATOR")
  @Id @Column(name="memberId") @Getter
  private Long id;
  
  @Column(nullable=false, unique=true) @Getter @Setter 
  private String nickName;
  
  
  @Column(nullable=false) @Setter @Getter
  private String password;
  
  @Transient @Getter @Setter
  private String repw;
  
  @Column(nullable=false) @Getter @Setter
  private Character type;
  
  @Column(nullable=false, name="gender") @Getter @Setter
  private Integer genderCode;
  
  @Getter @Setter
  @Column(nullable = false)
  private Date birth;
  
  @Column(name="taste") @Getter @Setter
  private String tasteCode;
  
  @Transient
  @OneToMany(targetEntity=Points.class)
  @JoinColumn(name="memberId")
  @Getter @Setter
  private List<Points> pointList = new ArrayList<Points>();
  
  @Column(nullable=false) @Getter @Setter
  private int points;
  
  @Transient @Getter @Setter
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
	  this.points = 20;
	  //this.myData = new MyData();
  }
  
  public void insertPoints(Points p) {
	  pointList.add(p);
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
