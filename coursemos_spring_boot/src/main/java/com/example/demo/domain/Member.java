package com.example.demo.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.springframework.data.annotation.Id;

//import com.example.dto.OAuthAttributes.OAuthAttributesBuilder;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
@SuppressWarnings("serial")
//public class Member extends BaseEntity implements Serializable {
public class Member  implements Serializable {
  /* Private Fields */

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  
  @Column(nullable=false)
  private String nickName;
  @Column(nullable = false)
  private int gender;
  @Column(nullable = false)
  private String birth;
  @Column(nullable = false)
  private String userName;
  @Column()
  private String taste;
  
  private MyData myData;
  
  private Role role;

  /* JavaBeans Properties */

  public String getNickName() { return nickName; }
  public void setNickName(String nickName) { this.nickName = nickName; }
  public int getGender() {
	  return gender;
	  }
  public void setGender(int gender) {
	  this.gender = gender;
	  }
  public String getBirth() {
	  return birth;
	  }
  public void setBirth(String birth) {
	  this.birth = birth;
	  }
  public String getUserName() {
	  return userName;
  }
  public void setUserName(String userName) {
	  this.userName = userName;
	  }
  public String getTaste() {
	  return taste;
	  }
  public void setTaste(String taste) {
	  this.taste = taste;
	  }
  public MyData getMyData() {
	  return myData;
	  }
  public void setMyData(MyData myData) {
	  this.myData = myData;
	  }
//@Builder
//public Member(String nickName, int gender, String birth, String userName, String taste, Role role) {
//		super();
//		this.nickName = nickName;
//		this.gender = gender;
//		this.birth = birth;
//		this.userName = userName;
//		this.taste = taste;
//		this.role = role;
//	}
public void setRole(Role role) {
	this.role = role;
}
public String getRoleKey() {
	return this.role.getKey();
}
}
