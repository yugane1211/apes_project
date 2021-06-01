package com.spring.database;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.beans.User;

public interface UserMapper {

	@Insert("insert into usertable values(#{user_id}, #{user_password}, #{user_phone},#{user_nickname})")
	public void addUserInfo(User user);
	
	
	@Select("select * from usertable where user_id=#{user_id} and user_password=#{user_password}")
	public User findtoLogin(User user);
	
	@Select("select user_id from usertable where user_phone=#{phone}")
	public List<String> findEmail(String phone);
	
	@Update("update usertable set user_password=#{user_password} where user_id=#{user_id}")
	public void modifyUserPassword(User user);
	
	@Select("select user_nickname from usertable where user_id=#{user_id}")
	public String checkUserIdExist(String user_id);
	
	@Update("update usertable set user_password=#{user_password},user_nickname=#{user_nickname},user_phone=#{user_phone} where user_id=#{user_id}")
	public void modifyUser(User user);
}
