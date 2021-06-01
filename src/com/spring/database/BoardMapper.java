package com.spring.database;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.beans.Board;

public interface BoardMapper {
	//자유게시판 글 개수 가져오기
	@Select("select count(*) from board where post_cate='자유'")
	public int countAll();
	
	//문의게시판 글 개수 가져오기
	@Select("select count(*) from board where post_cate='문의'")
	public int QnacountAll();
	
	//자유게시판 들어올때 첫화면에 띄우기 위한 작업
	@Select("select * from (select A.*, Rownum Rnum from (select post_num, post_sub, user_nickname, post_date,post_img, post_cate from board natural join usertable where post_cate='자유' order by post_date desc) A) where Rnum>=#{param1} and Rnum<=#{param2}")
	public List<Board> allFreeBoard(int startRow,int endRow);
	
	//문의게시판 들어올때 첫화면에 띄우기 위한 작업
	@Select("select * from (select A.*, Rownum Rnum from (select post_num, post_sub, user_id, user_nickname, post_date,post_img, post_cate from board natural join usertable where post_cate='문의' order by post_date desc) A) where Rnum>=#{param1} and Rnum<=#{param2}")
	public List<Board> allQnaBoard(int startRow,int endRow);
	
	//글 제목 선택 시 글을 읽는 작업
	@Select("select post_num, post_sub, user_nickname, user_id, post_date, post_content, post_img from board natural join usertable where post_num=#{post_num}")
	public Board selectOneBoard(String post_num);
	
	
	//작성글을 DB에 저장
	@Insert("insert into board values(board_seq.nextval,#{user_id},sysdate,#{post_sub},#{post_content},#{post_img},'자유')")
	public void uploadBoard(Board board);
	//작성글을 DB에 저장
	@Insert("insert into board values(board_seq.nextval,#{user_id},sysdate,#{post_sub},#{post_content},#{post_img},'문의')")
	public void uploadQnaBoard(Board board);
	
	//가장 최근 글의 글번호 가져오기
	@Select("select post_num from (select * from board order by post_date desc) where rownum=1")
	public String getPostNo();
	
	//글 삭제하기
	@Delete("delete from board where post_num=#{post_num}")
	public void deletePost(int post_num);
	
	//글 수정하기
	@Update("update board set post_sub='[수정됨]'||#{post_sub}, post_content=#{post_content}, post_img=#{post_img}, post_date=sysdate where post_num=#{post_num}")
	public void updateBoard(Board writeform);
	
	//글의 카테고리 가져오기
	@Select("select post_cate from board where post_num=#{param1}")
	public String getCategory(int post_num);
	
	//특정 사용자의 게시글 전부 받아오기(최근 5개)
	@Select("select * from (select A.*, Rownum Rnum from (select * from board where user_id=#{param1} order by post_date desc) A) where Rnum>=1 and Rnum<=5")
	public List<Board> allMyBoard(String user_id);
	
	
}
