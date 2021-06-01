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
	
	//ȸ�����Խ� ���� ����
	public void addUserInfo(User user) {
		userdao.addUserInfo(user);
	}
	//�α��ν� DB�� �ִ� �������� Ȯ���ϱ�
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
	
	//�޴��� ��ȣ�� �̸���(=���̵�) ã��
	public List<String> findEmail(String phone){
		return userdao.findEmail(phone);
	}
	
	//��й�ȣ ����
	public void modifyUserPassword(User user) {
		userdao.modifyUserPassword(user);
	}
	
	//ȸ������ ����
	public void modifyUser(User user) {
		userdao.modifyUser(user);
	}

	
	//�ߺ��˻�
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
