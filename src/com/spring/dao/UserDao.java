package com.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beans.User;
import com.spring.database.UserMapper;

@Repository
public class UserDao {
	@Autowired
	private UserMapper usermapper;
	
	//새로운 유저 정보를 DB에 삽입
	public void addUserInfo(User user) {
		usermapper.addUserInfo(user);
	}
	
	//특정 조건에 맞는 유저정보 찾기
	public User findtoLogin(User user) {
		return usermapper.findtoLogin(user);
	}
	
	//휴대폰 번호로 이메일 찾기
	public List<String> findEmail(String phone){
		return usermapper.findEmail(phone);
	}
	
	//새로운 비밀번호 수정
	public void modifyUserPassword(User user) {
		usermapper.modifyUserPassword(user);
	}
	//중복검사
	public String checkUserIdExist(String user_id) {
		return usermapper.checkUserIdExist(user_id);
	}
	//새로운 회원정보 수정
	public void modifyUser(User user) {
		usermapper.modifyUser(user);
	}
}
