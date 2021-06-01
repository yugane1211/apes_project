package com.spring.database;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.beans.Pass;

public interface PassMapper {
	
	@Insert("insert into pass values(pass_seq.nextval, #{user_id}, null,#{pass_type},#{pass_time},#{pass_use})")
	public void insertPass(Pass passBean);
	
	@Select("select pass_num,user_id,pass_start,pass_type,pass_time,pass_use,pass_start+pass_type as pass_finish from pass where user_id=#{user_id}")
	public List<Pass> getPasses(String user_id);
	
	
	//최초 이용 시작시에 시간 등록
	@Update("update pass set pass_start=sysdate where pass_num=#{param1} and pass_start is null")
	public void updateStart(int pass_num);
}
