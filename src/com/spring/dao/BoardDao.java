package com.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beans.Board;
import com.spring.database.BoardMapper;

@Repository
public class BoardDao {
	@Autowired
	private BoardMapper boardmapper;
	
	public int countAll() {
		return boardmapper.countAll();
	}
	
	public List<Board> allFreeBoard(int startRow,int endRow){
		return boardmapper.allFreeBoard(startRow,endRow);
	}
	
	public Board selectOneBoard(String post_num) {
		return boardmapper.selectOneBoard(post_num);
	}
	
	public void uploadBoard(Board board) {
		boardmapper.uploadBoard(board);
	}
	public void uploadQnaBoard(Board board) {
		boardmapper.uploadQnaBoard(board);
	}
	
	public String getPostNo() {
		return boardmapper.getPostNo();
	}
	
	public void deletePost(int post_num) {
		boardmapper.deletePost(post_num);
	}
	

	public void updateBoard(Board writeform) {
		boardmapper.updateBoard(writeform);
	}
	
    public List<Board> allQnaboard(int startRow, int endRow){
	      
	    return boardmapper.allQnaBoard(startRow, endRow);
	}
    
    public int QnacountAll() {
        // TODO Auto-generated method stub
        return boardmapper.QnacountAll();
     }
	
	public String getCategory(int post_num) {
		return boardmapper.getCategory(post_num);
	}
	
	public List<Board> allMyBoard(String user_id){
		return boardmapper.allMyBoard(user_id);
	}
}
