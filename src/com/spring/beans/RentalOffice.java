package com.spring.beans;

public class RentalOffice {
	private int renoff_num; //�뿩�� �ĺ���ȣ
	private String renoff_name; //�뿩�� �̸�
	private int renoff_la; //�뿩�� ����
	private int renoff_lo; //�뿩�� �浵
	private int renoff_bic;//�� �뿩�ҿ� �ִ� ������ ���
	private int renoff_kick;//�� �뿩�ҿ� �ִ� ű���� ���
	public int getRenoff_bic() {
		return renoff_bic;
	}
	public void setRenoff_bic(int renoff_bic) {
		this.renoff_bic = renoff_bic;
	}
	public int getRenoff_kick() {
		return renoff_kick;
	}
	public void setRenoff_kick(int renoff_kick) {
		this.renoff_kick = renoff_kick;
	}
	public int getRenoff_num() {
		return renoff_num;
	}
	public void setRenoff_num(int renoff_num) {
		this.renoff_num = renoff_num;
	}
	public String getRenoff_name() {
		return renoff_name;
	}
	public void setRenoff_name(String renoff_name) {
		this.renoff_name = renoff_name;
	}
	public int getRenoff_la() {
		return renoff_la;
	}
	public void setRenoff_la(int renoff_la) {
		this.renoff_la = renoff_la;
	}
	public int getRenoff_lo() {
		return renoff_lo;
	}
	public void setRenoff_lo(int renoff_lo) {
		this.renoff_lo = renoff_lo;
	}
}
