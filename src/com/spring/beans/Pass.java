package com.spring.beans;

import java.util.Date;

public class Pass {
	private int pass_num;//�̿�� ������ȣ
	private String user_id;//���� ���̵�

	private String pass_start;//�̿�� ������
	private String pass_finish;//�̿�� ������
	public String getPass_finish() {
		return pass_finish;
	}
	public void setPass_finish(String pass_finish) {
		this.pass_finish = pass_finish;
	}
	private int pass_type;//�̿�� ����
	private int pass_time;//�̿�� ��밡�ɽð�
	private int pass_use;//�̿�� ���� �ð�(�ڵ����� ����)
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
