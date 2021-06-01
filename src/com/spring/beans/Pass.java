package com.spring.beans;

import java.util.Date;

public class Pass {
	private int pass_num;//이용권 고유번호
	private String user_id;//유저 아이디

	private String pass_start;//이용권 시작일
	private String pass_finish;//이용권 종료일
	public String getPass_finish() {
		return pass_finish;
	}
	public void setPass_finish(String pass_finish) {
		this.pass_finish = pass_finish;
	}
	private int pass_type;//이용권 종류
	private int pass_time;//이용권 사용가능시간
	private int pass_use;//이용권 남은 시간(자동갱신 예정)
	public int getPass_num() {
		return pass_num;
	}
	public void setPass_num(int pass_num) {
		this.pass_num = pass_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPass_start() {
		return pass_start;
	}
	public void setPass_start(String pass_start) {
		this.pass_start = pass_start;
	}
	public int getPass_type() {
		return pass_type;
	}
	public void setPass_type(int pass_type) {
		this.pass_type = pass_type;
	}
	public int getPass_time() {
		return pass_time;
	}
	public void setPass_time(int pass_time) {
		this.pass_time = pass_time;
	}
	public int getPass_use() {
		return pass_use;
	}
	public void setPass_use(int pass_use) {
		this.pass_use = pass_use;
	}
	
}
