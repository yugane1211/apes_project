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

	//이용권 정보 가져오기
	public List<Pass> getPasses(String user_id){
		return passdao.getPasses(user_id);
	}
	
	//이용권 시작 시간 등록
	public void updateStart(int pass_num) {
		passdao.updateStart(pass_num);
	}
}
