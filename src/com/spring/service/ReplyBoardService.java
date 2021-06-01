package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beans.ReplyBoard;
import com.spring.dao.ReplyBoardDao;

@Service
public class ReplyBoardService {
	//��� ���̱�
	
	@Autowired
	private ReplyBoardDao replyboarddao;
	
	public List<ReplyBoard> replylist(String post_num){
		return replyboarddao.replylist(post_num);
	}
	
	
	//��� DB�� ����
	
	public void insertReply(ReplyBoard replyForm) {
		replyboarddao.insertReply(replyForm);
	}
	
	//��� ���� ī��Ʈ
	public int getCount(int rownum) {
		return replyboarddao.getCount(rownum);
	}
	
	//��� ��ü ����
	public void deleteReplies(int post_num) {
		replyboarddao.deleteReplies(post_num);
	}
}
