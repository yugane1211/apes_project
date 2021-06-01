package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beans.Pass;
import com.spring.dao.PassDao;

@Service
public class PassService {
	@Autowired
	private PassDao passdao;
	
	public void insertPass(Pass passBean) {
		passdao.insertPass(passBean);
	}

	//�̿�� ���� ��������
	public List<Pass> getPasses(String user_id){
		return passdao.getPasses(user_id);
	}
	
	//�̿�� ���� �ð� ���
	public void updateStart(int pass_num) {
		passdao.updateStart(pass_num);
	}
}
