package com.spring.database;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.beans.Board;

public interface BoardMapper {
	//�����Խ��� �� ���� ��������
	@Select("select count(*) from board where post_cate='����'")
	public int countAll();
	
	//���ǰԽ��� �� ���� ��������
	@Select("select count(*) from board where post_cate='����'")
	public int QnacountAll();
	
	//�����Խ��� ���ö� ùȭ�鿡 ���� ���� �۾�
	@Select("select * from (select A.*, Rownum Rnum from (select post_num, post_sub, user_nickname, post_date,post_img, post_cate from board natural join usertable where post_cate='����' order by post_date desc) A) where Rnum>=#{param1} and Rnum<=#{param2}")
	public List<Board> allFreeBoard(int startRow,int endRow);
	
	//���ǰԽ��� ���ö� ùȭ�鿡 ���� ���� �۾�
	@Select("select * from (select A.*, Rownum Rnum from (select post_num, post_sub, user_id, user_nickname, post_date,post_img, post_cate from board natural join usertable where post_cate='����' order by post_date desc) A) where Rnum>=#{param1} and Rnum<=#{param2}")
	public List<Board> allQnaBoard(int startRow,int endRow);
	
	//�� ���� ���� �� ���� �д� �۾�
	@Select("select post_num, post_sub, user_nickname, user_id, post_date, post_content, post_img from board natural join usertable where post_num=#{post_num}")
	public Board selectOneBoard(String post_num);
	
	
	//�ۼ����� DB�� ����
	@Insert("insert into board values(board_seq.nextval,#{user_id},sysdate,#{post_sub},#{post_content},#{post_img},'����')")
	public void uploadBoard(Board board);
	//�ۼ����� DB�� ����
	@Insert("insert into board values(board_seq.nextval,#{user_id},sysdate,#{post_sub},#{post_content},#{post_img},'����')")
	public void uploadQnaBoard(Board board);
	
	//���� �ֱ� ���� �۹�ȣ ��������
	@Select("select post_num from (select * from board order by post_date desc) where rownum=1")
	public String getPostNo();
	
	//�� �����ϱ�
	@Delete("delete from board where post_num=#{post_num}")
	public void deletePost(int post_num);
	
	//�� �����ϱ�
	@Update("update board set post_sub='[������]'||#{post_sub}, post_content=#{post_content}, post_img=#{post_img}, post_date=sysdate where post_num=#{post_num}")
	public void updateBoard(Board writeform);
	
	//���� ī�װ� ��������
	@Select("select post_cate from board where post_num=#{param1}")
	public String getCategory(int post_num);
	
	//Ư�� ������� �Խñ� ���� �޾ƿ���(�ֱ� 5��)
	@Select("select * from (select A.*, Rownum Rnum from (select * from board where user_id=#{param1} order by post_date desc) A) where Rnum>=1 and Rnum<=5")
	public List<Board> allMyBoard(String user_id);
	
	
}
