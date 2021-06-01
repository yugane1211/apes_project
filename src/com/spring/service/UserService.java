package com.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beans.User;
import com.spring.dao.UserDao;

@Service
public class UserService {
	@Autowired
	private UserDao userdao;
	
	@Resource(name="userlogin")
	private User userlogin;
	
	//회원가입시 정보 삽입
	public void addUserInfo(User user) {
		userdao.addUserInfo(user);
	}
	//로그인시 DB에 있는 정보인지 확인하기
	public void findtoLogin(User user) {
		User temp1=userdao.findtoLogin(user);
		
		if(temp1!=null) {
			userlogin.setUser_id(temp1.getUser_id());
			userlogin.setUser_nickname(temp1.getUser_nickname());
			userlogin.setUser_password(temp1.getUser_password());
			if(temp1.getUser_phone().charAt(0)!='0') {
				userlogin.setUser_phone("0"+temp1.getUser_phone());	
			}else {
				userlogin.setUser_phone(temp1.getUser_phone());
			}
			userlogin.setUser_login(true);
		}
	}
	
	//휴대폰 번호로 이메일(=아이디) 찾기
	public List<String> findEmail(String phone){
		return userdao.findEmail(phone);
	}
	
	//비밀번호 수정
	public void modifyUserPassword(User user) {
		userdao.modifyUserPassword(user);
	}
	
	//회원정보 수정
	public void modifyUser(User user) {
		userdao.modifyUser(user);
	}

	
	//중복검사
	public boolean checkUserIdExist(String user_id) {
		// TODO Auto-generated method stub
		String user_name = userdao.checkUserIdExist(user_id);
		
		if(user_name == null) {
			return true;
		} else {
			return false;
		}
	}
}
