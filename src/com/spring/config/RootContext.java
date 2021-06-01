package com.spring.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.spring.beans.Board;
import com.spring.beans.BoardPages;
import com.spring.beans.MailBean;
import com.spring.beans.Pass;
import com.spring.beans.ReplyBoard;
import com.spring.beans.User;
import com.spring.validate.UserValidator;


@Configuration
public class RootContext {
	@Bean("userlogin")
	@SessionScope
	public User userlogin() {
		return new User();
	}
	
	@Bean("emailS")
	@SessionScope
	public MailBean settingmail() {
		MailBean mk= new MailBean();
		mk.setHost("smtp.gmail.com");
		mk.setPort(587);
		mk.setUsername("yugane1737@gmail.com");
		mk.setPassword("ZeroDark1737!!");
		mk.setDefaultEncoding("utf-8");
		Properties prop = new Properties(); 
		prop.setProperty("mail.smtp.auth", "true"); 
		prop.setProperty("mail.smtp.starttls.enable", "true");	
		mk.setJavaMailProperties(prop);
		return mk;
	}
	
	@Bean
	public UserValidator valid() {
		return new UserValidator();
	}//���̵� �ߺ��˻�
	
	/*@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(1024*1024*100);
		return multipartResolver;
	}*/
	@Bean("writeform")
	@SessionScope
	public Board writeform() {
		return new Board();
	}//�� ���⸦ �� ���� �ӽ÷� �� ������ �����ϱ� ���� ��
	
	@Bean("pageCalculator")
	@SessionScope
	public BoardPages calculator() {
		return new BoardPages();
	}//������ �� ����ؼ� ȭ�鿡 ���� ���� ��
	
	
	@Bean("replyForm")
	@RequestScope
	public ReplyBoard replyForm() {
		return new ReplyBoard();
	}//��� �ۼ� ���� ��
	
	
	//�̿�� ���� �Ϸ� �� �̿�� ���� ����
	@Bean("passBean")
	@RequestScope
	public Pass passBean() {
		return new Pass();
	}
	
	
	
	
	
	
	
	
}
