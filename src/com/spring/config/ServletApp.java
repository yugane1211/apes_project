package com.spring.config;

import java.sql.Connection;




import javax.validation.Valid;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.ExecutorType;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.TransactionIsolationLevel;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.spring.database.BoardMapper;
import com.spring.database.PassMapper;
import com.spring.database.RentalMapper;
import com.spring.database.ReplyBoardMapper;
import com.spring.database.UserMapper;



@Configuration

@EnableWebMvc

@ComponentScan("com.spring.controller")
@ComponentScan("com.spring.dao")
@ComponentScan("com.spring.service")

@PropertySource("WEB-INF/properties/db.properties")
public class ServletApp implements WebMvcConfigurer{
	

	//������Ƽ�κ��� ���Թ޴� �۾�
	@Value("oracle.jdbc.OracleDriver")
	private String db_classname;
	@Value("jdbc:oracle:thin:@localhost:1521:xe")
	private String db_url;
	@Value("sys as sysdba")
	private String db_username;
	@Value("Darkzero1463!!")
	private String db_password;
	
	
	
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	
	//error �޽��� ���
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource re=new ReloadableResourceBundleMessageSource();
		re.setBasenames("/WEB-INF/properties/error"); //properties ������ �޽����� ���
		return re;
	}

	//BasicDataSource -> DB ���� ���� ����
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source=new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		return source;
	}
	//DB ����, SQL ���࿡ ���� ��ü, BasicDataSource �����ؼ� mybatis�� db���� ����
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception{
		SqlSessionFactoryBean fac=new SqlSessionFactoryBean();
		fac.setDataSource(source);
		SqlSessionFactory sqf=fac.getObject();
		return sqf;
	}
	
	//������ ���� ���� ��ü
	@Bean
	public MapperFactoryBean<UserMapper> ma(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<UserMapper> fac=new MapperFactoryBean<UserMapper>(UserMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}
	@Bean
	public MapperFactoryBean<BoardMapper> mba(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<BoardMapper> fac=new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}
	@Bean
	public MapperFactoryBean<ReplyBoardMapper> mrb(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<ReplyBoardMapper> fac=new MapperFactoryBean<ReplyBoardMapper>(ReplyBoardMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}
	@Bean
	public MapperFactoryBean<PassMapper> mpc(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<PassMapper> fac=new MapperFactoryBean<PassMapper>(PassMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}
	@Bean
	public MapperFactoryBean<RentalMapper> ren(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<RentalMapper> fac=new MapperFactoryBean<RentalMapper>(RentalMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}
}










