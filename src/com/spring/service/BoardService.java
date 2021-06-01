package com.spring.service;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.beans.Board;
import com.spring.dao.BoardDao;

@Service
public class BoardService {
	@Autowired
	private BoardDao boarddao;
	
	//�Խñ� ���� ��������
	public int countAll() {
		return boarddao.countAll();
	}
	
	
	//�Խñ� ��������
	public List<Board> allFreeBoard(int startRow,int endRow){
		return boarddao.allFreeBoard(startRow,endRow);
	}
	
	//�Խñ� �б�
	public Board selectOneBoard(String post_num) {
		return boarddao.selectOneBoard(post_num);
	}
	
	
	//������ ���ε��� �� ��θ� �����ϰ� �� ���� ��ȯ�޴� �޼ҵ�?
	
	public String getFileName(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");//�ѱ� �̸����� ���ε��� �� ���� ����
		int size=10*1024*1024;
		String encType="EUC-KR";
		//ServletContext context=request.getServletContext();
		String filepath="C:\\Users\\82105\\eclipse-workspace000\\Apes_Project\\src\\main\\webapp\\resources\\upload_images";
		
		String fileK="";

		try {
			MultipartRequest multii=new MultipartRequest(request, filepath,size,encType, new DefaultFileRenamePolicy());	
			//���ε�� ���� �̸� ���
			Enumeration files= multii.getFileNames();
			while(files.hasMoreElements()) {
				String file=(String)files.nextElement();
				//String file_name=multii.getFilesystemName(file);
				String origin=multii.getOriginalFileName(file);//���� ���� �̸�
				fileK+=origin;
			}
		}catch(Exception e) {e.printStackTrace();}
		System.out.println(fileK);
		return fileK;
	}
	
	
	//���ε��� ���� DB�� insert
	public void uploadBoard(Board board) {
		boarddao.uploadBoard(board);
	}
	//���ε��� ���� DB�� insert
	public void uploadQnaBoard(Board board) {
		boarddao.uploadQnaBoard(board);
	}
	//���� �ֱ� ���� �۹�ȣ ��������
	public String getPostNo() {
		return boarddao.getPostNo();
	}

	//�Խñ� ����
	public void deletePost(int post_num) {
		boarddao.deletePost(post_num);
	}
	
	
	//�Խñ� ����
	public void updateBoard(Board writeform) {
		boarddao.updateBoard(writeform);
	}
	
	//���ǰԽñ� �� ���
	public int QnacountAll() {
		return boarddao.QnacountAll();
	}
	
	
	//���ǰԽñ� ��������
	public List<Board> allQnaBoard(int startRow, int endRow){
	      
	      return boarddao.allQnaboard(startRow, endRow);
	   }
	
	//�Խñ��� ī�װ� ��������
	public String getCategory(int post_num) {
		return boarddao.getCategory(post_num);
	}
	
	//Ư�� ������ �� ��� ��������
	public List<Board> allMyBoard(String user_id){
		return boarddao.allMyBoard(user_id);
	}
	
	
}
