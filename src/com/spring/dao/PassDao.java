package com.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beans.Pass;
import com.spring.database.PassMapper;

@Repository
public class PassDao {
	@Autowired
	private PassMapper passmapper;
	
	public void insertPass(Pass passBean) {
		passmapper.insertPass(passBean);
	}
	
	//이용권 정보 가져오기
	public List<Pass> getPasses(String user_id){
		return passmapper.getPasses(user_id);
	}
	//이용권 시작 시간 등록
	public void updateStart(int pass_num) {
		passmapper.updateStart(pass_num);
	}
}
