package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.service.UserService;

@RestController
public class UserRestController {
	@Autowired
	private UserService userservice;
	
	//���̵� �ߺ��˻�(by �屺)
	@PostMapping("/user/checkUserIdExist")
	public String checkUserIdExist(@RequestParam String user_id) { //�ذ��ؾ� �ϴ� �κ�
		boolean chk = userservice.checkUserIdExist(user_id);
		System.out.println(chk+"");
		return chk + "";
	}
}
