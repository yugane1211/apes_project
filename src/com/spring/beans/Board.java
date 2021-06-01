package com.spring.beans;
//게시판 글 관련 DB 저장하는 빈(댓글 제외)
public class Board {

	//필드 정의
	//1. 게시글번호
	private int post_num;
	//2. 유저 아이디
	private String user_id;
	private String user_nickname;
	private String post_date;
	private String post_sub;
	private String post_content;
	private String post_img;
	private String post_cate;
	private int number;//화면에 띄우기 위한 번호
	private int replyCount; //댓글 개수
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
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
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_sub() {
		return post_sub;
	}
	public void setPost_sub(String post_sub) {
		this.post_sub = post_sub;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_img() {
		return post_img;
	}
	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}
	public String getPost_cate() {
		return post_cate;
	}
	public void setPost_cate(String post_cate) {
		this.post_cate = post_cate;
	}
	
	
}
