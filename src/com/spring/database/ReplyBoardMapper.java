package com.spring.database;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.spring.beans.ReplyBoard;

public interface ReplyBoardMapper {
	   // ��� ���
	   @Select("select re_num, post_num,user_nickname,user_id,re_content,re_date from reply natural join usertable where post_num = #{post_num}")
	   public List<ReplyBoard> replylist (String post_num);
	   
	   //��� �Է�
	   
	   @Insert("insert into reply values(reply_seq.nextval, #{post_num},#{user_id},sysdate,#{re_content})")
	   public void insertReply(ReplyBoard replyForm);
	   
	   
	   //��� ����
	   @Select("select count(*) from reply where post_num=#{param1}")
	   public int getCount(int rownum);
	   
	   //��� ��ü ����
	   @Delete("delete from reply where post_num=#{post_num}")
	   public void deleteReplies(int post_num);
}
