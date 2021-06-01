package com.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beans.ReplyBoard;
import com.spring.database.ReplyBoardMapper;


@Repository
public class ReplyBoardDao {
	@Autowired
	private ReplyBoardMapper replyboardmapper;
	
	public List<ReplyBoard> replylist(String post_num){
		return replyboardmapper.replylist(post_num);
	}
	
	public void insertReply(ReplyBoard replyForm) {
		replyboardmapper.insertReply(replyForm);
	}
	public int getCount(int rownum) {
		return replyboardmapper.getCount(rownum);
	}
	
	//댓글 전체 삭제
	public void deleteReplies(int post_num) {
		replyboardmapper.deleteReplies(post_num);
	}
}
