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
	
	//게시글 개수 가져오기
	public int countAll() {
		return boarddao.countAll();
	}
	
	
	//게시글 가져오기
	public List<Board> allFreeBoard(int startRow,int endRow){
		return boarddao.allFreeBoard(startRow,endRow);
	}
	
	//게시글 읽기
	public Board selectOneBoard(String post_num) {
		return boarddao.selectOneBoard(post_num);
	}
	
	
	//파일을 업로드할 때 경로를 저장하고 그 값을 반환받는 메소드?
	
	public String getFileName(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");//한글 이름으로 업로드할 때 깨짐 방지
		int size=10*1024*1024;
		String encType="EUC-KR";
		//ServletContext context=request.getServletContext();
		String filepath="C:\\Users\\82105\\eclipse-workspace000\\Apes_Project\\src\\main\\webapp\\resources\\upload_images";
		
		String fileK="";

		try {
			MultipartRequest multii=new MultipartRequest(request, filepath,size,encType, new DefaultFileRenamePolicy());	
			//업로드된 파일 이름 얻기
			Enumeration files= multii.getFileNames();
			while(files.hasMoreElements()) {
				String file=(String)files.nextElement();
				//String file_name=multii.getFilesystemName(file);
				String origin=multii.getOriginalFileName(file);//원본 파일 이름
				fileK+=origin;
			}
		}catch(Exception e) {e.printStackTrace();}
		System.out.println(fileK);
		return fileK;
	}
	
	
	//업로드할 글을 DB에 insert
	public void uploadBoard(Board board) {
		boarddao.uploadBoard(board);
	}
	//업로드할 글을 DB에 insert
	public void uploadQnaBoard(Board board) {
		boarddao.uploadQnaBoard(board);
	}
	//가장 최근 글의 글번호 가져오기
	public String getPostNo() {
		return boarddao.getPostNo();
	}

	//게시글 삭제
	public void deletePost(int post_num) {
		boarddao.deletePost(post_num);
	}
	
	
	//게시글 수정
	public void updateBoard(Board writeform) {
		boarddao.updateBoard(writeform);
	}
	
	//문의게시글 수 계산
	public int QnacountAll() {
		return boarddao.QnacountAll();
	}
	
	
	//문의게시글 가져오기
	public List<Board> allQnaBoard(int startRow, int endRow){
	      
	      return boarddao.allQnaboard(startRow, endRow);
	   }
	
	//게시글의 카테고리 가져오기
	public String getCategory(int post_num) {
		return boarddao.getCategory(post_num);
	}
	
	//특정 유저의 글 모두 가져오기
	public List<Board> allMyBoard(String user_id){
		return boarddao.allMyBoard(user_id);
	}
	
	
}
