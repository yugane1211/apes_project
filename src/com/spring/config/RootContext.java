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
	}//아이디 중복검사
	
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
	}//글 쓰기를 할 때에 임시로 그 내용을 저장하기 위한 빈
	
	@Bean("pageCalculator")
	@SessionScope
	public BoardPages calculator() {
		return new BoardPages();
	}//페이지 수 계산해서 화면에 띄우기 위한 빈
	
	
	@Bean("replyForm")
	@RequestScope
	public ReplyBoard replyForm() {
		return new ReplyBoard();
	}//댓글 작성 위한 빈
	
	
	//이용권 결제 완료 시 이용권 정보 저장
	@Bean("passBean")
	@RequestScope
	public Pass passBean() {
		return new Pass();
	}
	
	
	
	
	
	
	
	
}
