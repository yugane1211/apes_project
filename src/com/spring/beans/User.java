package com.spring.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

//DB와 연동할 때에는 이쪽 변수명을 다 바꾸던가, 클래스를 새로 만들어야 함
public class User {
	
	
	@Email
	private String user_id;
	@Size(min=3, max=15)
	@Pattern(regexp = "[A-Za-z0-9]*")
	private String user_nickname;//닉네임 : 3~15글자
	
	@Size(min=8, max=20)
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z0-9]{8,}$")
	private String user_password; //비번 : 8~20글자
	
	private String user_password2;
	
	@Size(min=8, max=11)
	@Pattern(regexp = "[0-9]*")
	private String user_phone;
	
	private boolean user_login;
	private boolean idExist;
	
	
	public boolean isIdExist() {
		return idExist;
	}



	public void setIdExist(boolean idExist) {
		this.idExist = idExist;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_nickname() {
		return user_nickname;
	}



	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}



	public String getUser_password() {
		return user_password;
	}



	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}



	public String getUser_password2() {
		return user_password2;
	}



	public void setUser_password2(String user_password2) {
		this.user_password2 = user_password2;
	}



	public String getUser_phone() {
		return user_phone;
	}



	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}



	public boolean isUser_login() {
		return user_login;
	}



	public void setUser_login(boolean user_login) {
		this.user_login = user_login;
	}



	public User() {
		this.user_login=false;
		this.idExist=true;
	}
	

}
