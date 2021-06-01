package com.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

import com.spring.beans.Pass;
import com.spring.beans.User;
import com.spring.service.PassService;

@Controller
@RequestMapping("/pass")
public class PassControl {
	
	@Resource(name="userlogin")
	private User userlogin;
	
	@Resource(name="passBean")
	private Pass passBean;
	
	@Autowired
	private PassService passservice;
	
	@GetMapping("/ticket")
	public String ticket() {
		return "pass/ticket";
	}
	
	@PostMapping("/ticket_proc")
	public String ticket_proc(HttpServletRequest request) {
		//�̿�� ����, �ݾ� �����ͼ� �𵨿� ����
		String pass=request.getParameter("pass");
		System.out.println(pass);
		String[] passes=pass.split(",");
		request.setAttribute("amount", passes[2]);
		
		request.setAttribute("pass", passes);



		//�α��ο���
		String user_login=request.getParameter("user_login");
		if(user_login.trim().equals("false")) {
			return "pass/ticket_login";
		}
		//��������
		String[] agree=request.getParameterValues("agree");
		if(agree==null) {
			return "pass/ticket_fail";
		}else if(agree.length!=2) {
			return "pass/ticket_fail";
		}

		return "pass/credit";
	}
	
	//��������/����
	@GetMapping("/creditSuccess")
	public String creditSuccess(HttpServletRequest request) {
		int pass_type=Integer.parseInt(request.getParameter("pass_type"));
		int pass_time=Integer.parseInt(request.getParameter("pass_time"));
		String user_id=userlogin.getUser_id();
		passBean.setPass_type(pass_type);
		passBean.setPass_time(pass_time);
		passBean.setPass_use(pass_time);
		passBean.setUser_id(user_id);
		
		passservice.insertPass(passBean);
		
		return "pass/creditSuccess";
	}
	@GetMapping("/creditFail")
	public String creditFail() {
		return "pass/creditFail";
	}
	
	

	
	
}
