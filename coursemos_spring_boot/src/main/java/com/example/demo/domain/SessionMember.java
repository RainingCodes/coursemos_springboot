package com.example.demo.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor @Getter @Setter @ToString
public class SessionMember implements Serializable {
	private Long id;
	private String nickName;
	private String password;
	private Integer genderCode;
	private Date birth;
	private int points;
	private String tasteCode;
	private boolean check1;
	private boolean check2;
	public SessionMember() {
		
	}
	public String getTaste() {
		switch(this.tasteCode) {
		case "act" :
			return "활동적";
		case "hea" :
			return "힐링되는";
		case "nat" :
			return "자연적인";
		case "exp":
			return "체험적인";
		case "ent":
			return "즐거운";
		case "ret":
			return "복고풍";
		case "cal":
			return "잔잔한";
			default:
				return null;
		}
	}
	public String getGender() {
		switch(this.genderCode) {
		case 0 :
			return "여자";
		case 1 :
			return "남자";
		case 2 :
			return "기타";
			default:
				return null;
		}
	}
	
}
