package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beans.ReplyBoard;
import com.spring.dao.ReplyBoardDao;

@Service
public class ReplyBoardService {
	//댓글 보이기
	
	@Autowired
	private ReplyBoardDao replyboarddao;
	
	public List<ReplyBoard> replylist(String post_num){
		return replyboarddao.replylist(post_num);
	}
	
	
	//댓글 DB에 저장
	
	public void insertReply(ReplyBoard replyForm) {
		replyboarddao.insertReply(replyForm);
	}
	
	//댓글 개수 카운트
	public int getCount(int rownum) {
		return replyboarddao.getCount(rownum);
	}
	
	//댓글 전체 삭제
	public void deleteReplies(int post_num) {
		replyboarddao.deleteReplies(post_num);
	}
}
