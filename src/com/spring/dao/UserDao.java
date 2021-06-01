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
	
	//���ο� ���� ������ DB�� ����
	public void addUserInfo(User user) {
		usermapper.addUserInfo(user);
	}
	
	//Ư�� ���ǿ� �´� �������� ã��
	public User findtoLogin(User user) {
		return usermapper.findtoLogin(user);
	}
	
	//�޴��� ��ȣ�� �̸��� ã��
	public List<String> findEmail(String phone){
		return usermapper.findEmail(phone);
	}
	
	//���ο� ��й�ȣ ����
	public void modifyUserPassword(User user) {
		usermapper.modifyUserPassword(user);
	}
	//�ߺ��˻�
	public String checkUserIdExist(String user_id) {
		return usermapper.checkUserIdExist(user_id);
	}
	//���ο� ȸ������ ����
	public void modifyUser(User user) {
		usermapper.modifyUser(user);
	}
}
