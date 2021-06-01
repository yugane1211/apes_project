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
	
	
	
	//DB���� �۹�ȣ, ����, �ۼ���, ��¥ ������ ���� + page ��ȣ�� size ����
	@GetMapping("/freedom")
	public String freedom(Model mo, HttpServletRequest request) {
		String pagesize=request.getParameter("pageSize"); //�� ������ �ٲپ��� �� �װ��� �Ķ���ͷ� ������ ���� ����
		int pageSize=5;//������ ��꿡 ����� ������ ������
		if(pagesize==null&&pageCalculator.getPageSize()==0) {//��ó���� ������ ������ �� �� ��� �������� �̵��� ���
			pageSize=5;
		}else if(pagesize==null) {//������ ��ȣ�� ������ �̵��� ��
			pageSize=pageCalculator.getPageSize();
		}
		else {//�������� �� ��(select-option) �� ������ ��
			pageSize=Integer.parseInt(pagesize);
		}
		String pagenum=request.getParameter("pageNum");
		int currentPage=1;//������ ����� ������ ��ȣ
		if(pagenum==null) {
			currentPage=1;
		}else {
			currentPage=Integer.parseInt(pagenum);
		}
		int count=0;//���� �� ����
		int number=0;//ȭ��� �������� ��ȣ
		count=boardservice.countAll();//�� ���� ���
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		List<Board> li = boardservice.allFreeBoard(startRow,endRow);//startrow, endrow �̿��ؼ� �ҷ�����
		
		number=count-(currentPage-1)*pageSize;
		/////////////////////////////
		int pageCount=1;//�ʱ�ȭ
		int startPage=1;//�ʱ�ȭ
		int endPage=10;//�ʱ�ȭ
		
		if(count>0) {
			pageCount=count/pageSize+(count%pageSize==0?0:1);// �� ������ ��
			if(currentPage%10!=0) {
				startPage=(int)(currentPage/10)*10+1;//1,11,21,31,..........
			}else {
				startPage=(int)(currentPage/10-1)*10+1;
			}//startpage(������������ȣ) �����ϴ� �ڵ�
			
			endPage=startPage-1+pageCalculator.getPageBlock();//���� ��������ȣ +9
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
		pageCalculator.setEndPage(endPage);//�ڵ������� �� ������ ����
		
		
		//��� ���� ī��Ʈ
		
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
	
	//���� ������ �� �д� ��������
	@GetMapping("/read")
	public String read(@RequestParam String post_num, Model mo) {
		Board board=boardservice.selectOneBoard(post_num);
		mo.addAttribute("board",board);
		
		//��� ���̱�
		List<ReplyBoard> li=replyboardservice.replylist(post_num);
		mo.addAttribute("reply",li);
		mo.addAttribute("user",userlogin);
		return "board/read";
	}
	
	//�۾��� ��ư�� ������ ���� ���� �������� �̵�
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
	//�۾��� ��ư�� ������ ���� ���� �������� �̵�
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
	
	
	
	
	//���� ���ε�
	@PostMapping("/pictureUpload")
	public String pictureupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String post_img=boardservice.getFileName(request);//���� ���ε� �� ���� �� �ִ� ������ ��θ� ����
		writeform.setPost_img(post_img);

		return "board/upload_proc";
		
	}
	
	
	
	//�� ���� ���
	
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
	
	//�� ���� ���
	
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
	
	//��� ���� 
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
	
	//�� �����ϱ�
	@GetMapping("/deleteProc")
	public String deleteProc(@RequestParam String postNum, @RequestParam String userId, @RequestParam String postId) {
		int post_num=Integer.parseInt(postNum);
		String post_cate=boardservice.getCategory(post_num);
		if(userId.equals(postId)) {
			if(post_cate.equals("����")) {
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
	
	
	
	//�� ���� �������� �̵�
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
	
	//�� �����ϱ�
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
		if(post_cate.equals("����")) {
			return "board/updateSuccess";
		}else {
			return "board/QnaupdateSuccess";
		}
		
		
		
	}	
	
	//���ǰԽ������� �̵�
	@GetMapping("/qna")
    public String qna(Model mo,  HttpServletRequest request) {
       
       
       String pagesize=request.getParameter("pageSize");// �� ������ �ٲپ����� �Ķ���͸� ������ ���� �ڵ�
       int pageSize=5; // ������ ��꿡 ����� ������ ������
       if(pagesize==null&&pageCalculator.getPageSize()==0) { // ��ó�� ������ �����Ҷ� �� ��� �������� �̵� �� ��� 
          pageSize=5; // �ʱ�ȭ �� 
       }else if(pagesize==null) {
          pageSize=pageCalculator.getPageSize(); // ������ ��ȣ�� ������ �̵��Ҷ� 
       }
       else {
          pageSize=Integer.parseInt(pagesize); // �������� �� �� (select - option )�� ���� �Ҷ� 
       }
       String pagenum=request.getParameter("pageNum");
       int currentPage=1; // ������ ����� ��ȣ
       if(pagenum==null) {
          currentPage=1;
       }else {
          currentPage=Integer.parseInt(pagenum);
       }
       int count=0;// ���� �� ���� 
       int number=0;// ȭ��� �������� ��ȣ
       count=boardservice.QnacountAll();//�� ���� ���
       int startRow=(currentPage-1)*pageSize+1; // ���������� ���� �� 
       int endRow=currentPage*pageSize; // �� �������� �� ���� ��
       List<Board> li = boardservice.allQnaBoard(startRow,endRow); //startrow, endrow �̿��ؼ� �ҷ�����
       
       number=count-(currentPage-1)*pageSize; // �ֽż��� ���� �߰� ���
       /////////////////////////////
       int pageCount=1;// �ʱ�ȭ
       int startPage=1;// �ʱ�ȭ
       int endPage=10; // �ʱ�ȭ
       
       if(count>0) { 
          pageCount=count/pageSize+(count%pageSize==0?0:1); // pagecount �� �������� 
          if(currentPage%10!=0) {
             startPage=(int)(currentPage/10)*10+1; // 1,11,21,31
          }else {
             startPage=(int)(currentPage/10-1)*10+1;
          } // startpage(������������ȣ) ��Ī�ϴ� �ڵ�
          
          endPage=startPage-1+pageCalculator.getPageBlock(); // ���� ������ ��ȣ ���� 9�� ���� ��������ȣ
          if(endPage>pageCount) {
             endPage=pageCount;
          }
          
       }
        // �ڵ� ������ ���� ������ ���� �ϴ� �ڵ��
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
