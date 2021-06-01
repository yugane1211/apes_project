package com.spring.beans;

import java.util.Date;

public class Rental {
	private int rental_num;
	private String renoff_name;
	private int renoff_num;

	private int bic_num;
	private int kick_num;
	private String user_id;
	private Date rental_start;
	private Date rental_finish;
	private int rental_time;
	private int using_time;//지금까지 사용한 시간(분)
	private int over_time;//초과 시간

	public int getUsing_time() {
		return using_time;
	}
	public void setUsing_time(int using_time) {
		this.using_time = using_time;
	}
	public int getOver_time() {
		return over_time;
	}
	public void setOver_time(int over_time) {
		this.over_time = over_time;
	}
	public int getRental_num() {
		return rental_num;
	}
	public void setRental_num(int rental_num) {
		this.rental_num = rental_num;
	}
	public int getBic_num() {
		return bic_num;
	}
	public void setBic_num(int bic_num) {
		this.bic_num = bic_num;
	}
	public int getKick_num() {
		return kick_num;
	}
	public void setKick_num(int kick_num) {
		this.kick_num = kick_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRental_start() {
		return rental_start;
	}
	public void setRental_start(Date rental_start) {
		this.rental_start = rental_start;
	}
	public Date getRental_finish() {
		return rental_finish;
	}
	public void setRental_finish(Date rental_finish) {
		this.rental_finish = rental_finish;
	}
	public int getRental_time() {
		return rental_time;
	}
	public void setRental_time(int rental_time) {
		this.rental_time = rental_time;
	}
	public String getRenoff_name() {
		return renoff_name;
	}
	public void setRenoff_name(String renoff_name) {
		this.renoff_name = renoff_name;
	}
	public int getRenoff_num() {
		return renoff_num;
	}
	public void setRenoff_num(int renoff_num) {
		this.renoff_num = renoff_num;
	}
}
