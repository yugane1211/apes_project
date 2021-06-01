package com.spring.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.spring.beans.Board;
import com.spring.beans.BoardPages;
import com.spring.beans.ReplyBoard;
import com.spring.beans.User;
import com.spring.service.BoardService;
import com.spring.service.ReplyBoardService;

@Controller
@RequestMapping("/board")
public class BoardControl {
	@Autowired
	private BoardService boardservice;
	@Autowired
	private ReplyBoardService replyboardservice;

	
	
	@Resource(name="userlogin")
	private User userlogin;
	@Resource(name="writeform")
	private Board writeform;

	@Resource(name="pageCalculator")
	private BoardPages pageCalculator;
	
	@Resource(name="replyForm")
	private ReplyBoard replyForm;
	
	
	
	//DB에서 글번호, 제목, 작성자, 날짜 가지고 오기 + page 번호와 size 적용
	@GetMapping("/freedom")
	public String freedom(Model mo, HttpServletRequest request) {
		String pagesize=request.getParameter("pageSize"); //글 개수를 바꾸었을 때 그것을 파라미터로 가지고 오는 세팅
		int pageSize=5;//실제로 계산에 사용할 페이지 사이즈
		if(pagesize==null&&pageCalculator.getPageSize()==0) {//맨처음에 서버를 실행할 때 글 목록 페이지로 이동할 경우
			pageSize=5;
		}else if(pagesize==null) {//페이지 번호를 눌러서 이동할 때
			pageSize=pageCalculator.getPageSize();
		}
		else {//페이지당 글 수(select-option) 를 변경할 때
			pageSize=Integer.parseInt(pagesize);
		}
		String pagenum=request.getParameter("pageNum");
		int currentPage=1;//실제로 사용할 페이지 번호
		if(pagenum==null) {
			currentPage=1;
		}else {
			currentPage=Integer.parseInt(pagenum);
		}
		int count=0;//글의 총 개수
		int number=0;//화면상에 보여지는 번호
		count=boardservice.countAll();//글 개수 계산
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		List<Board> li = boardservice.allFreeBoard(startRow,endRow);//startrow, endrow 이용해서 불러오기
		
		number=count-(currentPage-1)*pageSize;
		/////////////////////////////
		int pageCount=1;//초기화
		int startPage=1;//초기화
		int endPage=10;//초기화
		
		if(count>0) {
			pageCount=count/pageSize+(count%pageSize==0?0:1);// 총 페이지 수
			if(currentPage%10!=0) {
				startPage=(int)(currentPage/10)*10+1;//1,11,21,31,..........
			}else {
				startPage=(int)(currentPage/10-1)*10+1;
			}//startpage(시작페이지번호) 지정하는 코드
			
			endPage=startPage-1+pageCalculator.getPageBlock();//시작 페이지번호 +9
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
		}
		
		pageCalculator.setPageSize(pageSize);
		pageCalculator.setCurrentPage(currentPage);
		pageCalculator.setCount(count);
		pageCalculator.setContent_num(number);
		pageCalculator.setStartRow(startRow);
		pageCalculator.setEndRow(endRow);
		pageCalculator.setPageCount(pageCount);
		pageCalculator.setStartPage(startPage);
		pageCalculator.setEndPage(endPage);//자동주입한 빈에 값들을 저장
		
		
		//댓글 개수 카운트
		
		Iterator<Board> boardList=li.iterator();
		while(boardList.hasNext()) {
			Board boardBean=boardList.next();
			int rownum=boardBean.getPost_num();
			int replyCount=replyboardservice.getCount(rownum);
			boardBean.setReplyCount(replyCount);
		}
		
		
		
		
		request.setAttribute("pages",pageCalculator);
		mo.addAttribute("list",li);
		return "board/freedom";
	}
	
	//제목 누르면 글 읽는 페이지로
	@GetMapping("/read")
	public String read(@RequestParam String post_num, Model mo) {
		Board board=boardservice.selectOneBoard(post_num);
		mo.addAttribute("board",board);
		
		//댓글 보이기
		List<ReplyBoard> li=replyboardservice.replylist(post_num);
		mo.addAttribute("reply",li);
		mo.addAttribute("user",userlogin);
		return "board/read";
	}
	
	//글쓰기 버튼을 누르면 글을 쓰는 페이지로 이동
	@GetMapping("/fdwrite")
	public String fdwrite(@ModelAttribute("boardWriteBean") Board writeboard, @ModelAttribute("tempuserlogin") User user) {
		if(userlogin.isUser_login()==false) {
			return "redirect:/user/login?url=/board/freedom";
		}else {
			writeboard.setUser_id(userlogin.getUser_id());
			writeboard.setUser_nickname(userlogin.getUser_nickname());
			writeform.setPost_img("bicycle.jpg");
			return "board/fdwrite";
		}
		
	}
	//글쓰기 버튼을 누르면 글을 쓰는 페이지로 이동
	@GetMapping("/Qnawrite")
	public String Qnawrite(@ModelAttribute("boardWriteBean") Board writeboard, @ModelAttribute("tempuserlogin") User user) {
		if(userlogin.isUser_login()==false) {
			return "redirect:/user/login?url=/board/qna";
		}else {
			writeboard.setUser_id(userlogin.getUser_id());
			writeboard.setUser_nickname(userlogin.getUser_nickname());
			writeform.setPost_img("bicycle.jpg");
			return "board/Qnawrite";
		}
		
	}
	
	
	
	
	//사진 업로드
	@PostMapping("/pictureUpload")
	public String pictureupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String post_img=boardservice.getFileName(request);//파일 업로드 시 얻을 수 있는 파잃의 경로를 저장
		writeform.setPost_img(post_img);

		return "board/upload_proc";
		
	}
	
	
	
	//글 쓰기 등록
	
	@PostMapping("/fdinsert")
	public String fdinsert(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		String post_sub=request.getParameter("post_sub");
		String post_content=request.getParameter("post_content");
		String content=post_content.replace("\r\n", "<br>");
		writeform.setPost_sub(post_sub);
		writeform.setPost_content(content);
		writeform.setUser_id(userlogin.getUser_id());

		boardservice.uploadBoard(writeform);


		return "board/fdinsert";
		
	}
	
	//글 쓰기 등록
	
	@PostMapping("/Qnainsert")
	public String Qnainsert(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		String post_sub=request.getParameter("post_sub");
		String post_content=request.getParameter("post_content");
		String content=post_content.replace("\r\n", "<br>");
		writeform.setPost_sub(post_sub);
		writeform.setPost_content(content);
		writeform.setUser_id(userlogin.getUser_id());

		boardservice.uploadQnaBoard(writeform);


		return "board/Qnainsert";
		
	}
	
	//댓글 쓰기 
	@PostMapping("/writeReply")
	public String writeReply(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		int post_num=Integer.parseInt(request.getParameter("post_num"));
		String re_content=request.getParameter("re_content");
		replyForm.setPost_num(post_num);
		replyForm.setRe_content(re_content);
		
		replyForm.setUser_id(userlogin.getUser_id());
		
		replyboardservice.insertReply(replyForm);
		
		return "redirect:/board/read?post_num="+post_num;
	}
	
	//글 삭제하기
	@GetMapping("/deleteProc")
	public String deleteProc(@RequestParam String postNum, @RequestParam String userId, @RequestParam String postId) {
		int post_num=Integer.parseInt(postNum);
		String post_cate=boardservice.getCategory(post_num);
		if(userId.equals(postId)) {
			if(post_cate.equals("자유")) {
				replyboardservice.deleteReplies(post_num);
				boardservice.deletePost(post_num);
				
				return "board/deleteSuccess";
			}else {
				replyboardservice.deleteReplies(post_num);
				boardservice.deletePost(post_num);
				
				return "board/QnadeleteSuccess";
			}
			
		}else {
			return "board/deleteFail";
		}

	}
	
	
	
	//글 수정 페이지로 이동
	@GetMapping("/fdupdate")
	public String fdupdate(@RequestParam String post_num, @RequestParam String userId, @RequestParam String postId,Model mo ) {

		if(userId.equals(postId)) {
			Board board=boardservice.selectOneBoard(post_num);
			mo.addAttribute("board",board);
			return "board/fdupdate";
		}else {
			
			return "board/updateFail";
		}

	}
	
	//글 수정하기
	@PostMapping("/updateProc")
	public String updateProc(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		String post_sub=request.getParameter("post_sub");
		String post_content=request.getParameter("post_content");
		String post_num=request.getParameter("post_num");
		int postnum=Integer.parseInt(post_num);
		String post_cate=boardservice.getCategory(postnum);
		writeform.setPost_sub(post_sub);
		writeform.setPost_content(post_content);
		writeform.setPost_num(postnum);
		writeform.setUser_nickname(userlogin.getUser_nickname());
		
		boardservice.updateBoard(writeform);
		if(post_cate.equals("자유")) {
			return "board/updateSuccess";
		}else {
			return "board/QnaupdateSuccess";
		}
		
		
		
	}	
	
	//문의게시판으로 이동
	@GetMapping("/qna")
    public String qna(Model mo,  HttpServletRequest request) {
       
       
       String pagesize=request.getParameter("pageSize");// 글 개수를 바꾸었을때 파라미터를 가지고 오는 코드
       int pageSize=5; // 실제로 계산에 사용할 페이지 사이즈
       if(pagesize==null&&pageCalculator.getPageSize()==0) { // 맨처음 서버를 실행할때 글 목록 페이지로 이동 할 경우 
          pageSize=5; // 초기화 값 
       }else if(pagesize==null) {
          pageSize=pageCalculator.getPageSize(); // 페이지 번호를 눌러서 이동할때 
       }
       else {
          pageSize=Integer.parseInt(pagesize); // 페이지당 글 수 (select - option )을 변경 할때 
       }
       String pagenum=request.getParameter("pageNum");
       int currentPage=1; // 실제를 사용할 번호
       if(pagenum==null) {
          currentPage=1;
       }else {
          currentPage=Integer.parseInt(pagenum);
       }
       int count=0;// 글의 총 개수 
       int number=0;// 화면상에 보여지는 번호
       count=boardservice.QnacountAll();//글 개수 계산
       int startRow=(currentPage-1)*pageSize+1; // 각페이지의 시작 행 
       int endRow=currentPage*pageSize; // 각 페이지의 맨 끝의 행
       List<Board> li = boardservice.allQnaBoard(startRow,endRow); //startrow, endrow 이용해서 불러오기
       
       number=count-(currentPage-1)*pageSize; // 최신순의 글이 뜨게 계산
       /////////////////////////////
       int pageCount=1;// 초기화
       int startPage=1;// 초기화
       int endPage=10; // 초기화
       
       if(count>0) { 
          pageCount=count/pageSize+(count%pageSize==0?0:1); // pagecount 총 페이지수 
          if(currentPage%10!=0) {
             startPage=(int)(currentPage/10)*10+1; // 1,11,21,31
          }else {
             startPage=(int)(currentPage/10-1)*10+1;
          } // startpage(시작페이지번호) 지칭하는 코드
          
          endPage=startPage-1+pageCalculator.getPageBlock(); // 시작 페이지 번호 에서 9를 더한 페이지번호
          if(endPage>pageCount) {
             endPage=pageCount;
          }
          
       }
        // 자동 주입한 빈의 값들을 저장 하는 코드들
       pageCalculator.setPageSize(pageSize);
       pageCalculator.setCurrentPage(currentPage);
       pageCalculator.setCount(count);
       pageCalculator.setContent_num(number);
       pageCalculator.setStartRow(startRow);
       pageCalculator.setEndRow(endRow);
       pageCalculator.setPageCount(pageCount);
       pageCalculator.setStartPage(startPage);
       pageCalculator.setEndPage(endPage);
       
       request.setAttribute("pagesqna",pageCalculator);
       mo.addAttribute("listqna",li);
          
       return "board/qna";
    }
	
	@GetMapping("/notice")
	public String notice() {
		return "board/notice";
	}
	
	
	@GetMapping("/faq") 
	public String faq() {
		return "board/faq";
	}
	
	
	
	
	
	
	
	
	
}
