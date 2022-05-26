package com.example.demo.domain;
import java.io.Serializable;


@SuppressWarnings("serial")
public class User implements Serializable {

  /* Private Fields */

  private String nickName;
  private int gender;
  private String birth;
  private String userName;
  private String taste;
  private MyData myData;

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
public User(String nickName, int gender, String birth, String userName, String taste) {
		super();
		this.nickName = nickName;
		this.gender = gender;
		this.birth = birth;
		this.userName = userName;
		this.taste = taste;
	}
  public User(String nickName, int gender, String birth, String userName) {
		super();
		this.nickName = nickName;
		this.gender = gender;
		this.birth = birth;
		this.userName = userName;
		this.taste = null;
	}
 
}
