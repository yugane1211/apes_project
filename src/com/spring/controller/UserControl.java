package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.spring.beans.Board;
import com.spring.beans.MailBean;
import com.spring.beans.Pass;
import com.spring.beans.Rental;
import com.spring.beans.User;
import com.spring.service.BoardService;
import com.spring.service.PassService;
import com.spring.service.RentalService;
import com.spring.service.UserService;
import com.spring.validate.UserValidator;

@Controller
@RequestMapping("/user")
public class UserControl {
	
	@Autowired
	private UserService userservice;
	
	
	@Resource(name="userlogin")
	private User userlogin;
	
	//유효성 검사하는 클래스 등록
	@Autowired
	private UserValidator validator;
	
	
	
	//메인에서 로그인버튼 누르면
	@GetMapping("/login")
	public String login(@ModelAttribute("tempuserlogin") User user, HttpServletRequest request, Model mo) {
		String url=request.getParameter("url");
		mo.addAttribute("url",url);
		return "user/login";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		String url=request.getParameter("url");
		userlogin.setUser_login(false);
		userlogin.setUser_id("");
		userlogin.setUser_nickname("");
		userlogin.setUser_phone("");
		userlogin.setUser_password("");//로그아웃시 이 부분 수정했음

		
		return "redirect:/"+url;
	}
	
	//메인에서 회원가입버튼 누르면
	@GetMapping("/signin")
	public String signin(@ModelAttribute("usersignin") User user) {
		return "user/signin";
	}
	
	//회원가입창에서 입력 후 버튼 누르면
	@PostMapping("/signin_proc")
	public String signin_proc(@Valid @ModelAttribute("usersignin") User user,BindingResult br){
		validator.validate(user, br);
		if(br.hasErrors()) {
			return "user/signin";
		}else if(!(user.getUser_password().equals(user.getUser_password2()))){
			return "user/signin_fail";
		}
		userservice.addUserInfo(user);
		return "user/signin_proc";
	}
	
	//로그인창에서 입력 후 버튼 누르면
	@PostMapping("/login_proc")
	public String login_proc(@ModelAttribute("tempuserlogin") User user, HttpServletRequest request) {
		String addr=request.getParameter("url");

		request.setAttribute("url", addr);

		userservice.findtoLogin(user);
		if(userlogin.isUser_login()==false) {
			return "user/login_fail";
		}else {
			return "user/login_proc";
		}
		
	}
	
	//비번찾기 페이지로 이동
	@GetMapping("/find")
	public String find() {
		return "user/find";
	}
	
	//번호 입력 시 해당 번호로부터 이메일 찾기
	@PostMapping("/emailfind")
	public String emailfind(HttpServletRequest request, Model mo) {
		String phone=request.getParameter("phone");
		List<String> emails=userservice.findEmail(phone);
		int ea=emails.size();
		mo.addAttribute("email", emails);
		mo.addAttribute("re",ea);
		return "user/emailfind";
	}
	//javamailsender 가져오기(빈으로 등록했음)
	@Resource(name="emailS")
	private MailBean mailSender;
	//인증 메일 보내기
	@PostMapping("/emailsend")
	public ModelAndView certi_email(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//이메일값 가지고오기
		String e_mail=request.getParameter("user_id");

		//난수 6자리 생성
		int email_dice=0;
		for(int i=1;i<=6;i++) {
			int j;
			if(i==6) {
				j=(int)(Math.random()*9)+1;
			}else {
				j=(int)(Math.random()*10);
			}
			int pow=(int)Math.pow(10, i-1);
			email_dice+=j*pow;
		}
		//보낼 이메일 구성
		String setfrom="yugane1737@gmail.com";
		String title="[혹성탈출]비밀번호 찾기 인증 메일입니다.";
		String content=System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                        
                "안녕하세요 회원님 혹성탈출을 찾아주셔서 감사합니다"
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
        
                "비밀번호 찾기 인증번호는 " +email_dice+ " 입니다. "
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		
		
		//이메일 보내기 위한 try-catch
		try {
			
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(e_mail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//다음 페이지에서 가지고 갈 데이터와 띄울 뷰 이름 설정
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user/emailsend");
		
		request.setAttribute("email", e_mail);
		mv.addObject("dice",email_dice);
		return mv;
	}
	
	//인증번호 확인 후 일치시 새로운 비밀번호 입력하러
	@PostMapping("/mailconfig")
	public String mailconfig(HttpServletResponse response, HttpServletRequest request, ModelAndView mo, @ModelAttribute("passwordUpdate") User user) throws IOException {
		String input_conf=request.getParameter("press");
		String dice=request.getParameter("dice");
		String user_id=request.getParameter("email");

		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		
		if(input_conf.equals(dice)) {
			user.setUser_id(user_id);

			out.println("<script>alert('인증 완료');</script>");
			out.flush();
			return "user/mailconfig";
		}else {

			out.println("<script>alert('인증번호가 일치하지 않습니다.'); history.go(-1);</script>");
			out.flush();
			return "user/emailsend";
		}
	}
	
	//새로운 비밀번호를 입력해서 DB에 업데이트
	@PostMapping("/modifyPw")
	public String modifyPassword(@Valid @ModelAttribute("passwordUpdate") User user,BindingResult br, HttpServletResponse response) throws IOException{
		if(br.hasErrors()) {
			return "user/mailconfig";
		}else if(!(user.getUser_password().equals(user.getUser_password2()))){

			return "user/signin_fail";
		}
		userservice.modifyUserPassword(user);
		userlogin.setUser_password(user.getUser_password());
		return "user/modifyPw";
	}
	
	////////////////////////////////////////////////////////////////////////////
	@Autowired
	private BoardService boardservice;
	@Autowired
	private PassService passservice;
	@Autowired
	private RentalService rentalservice;
	
	
	//mypage
	@GetMapping("/mypage")
	public String mypageGo(Model mo) {
		String user_id=userlogin.getUser_id();
		if(user_id==null||user_id.equals("")) {
			return "redirect:/user/login?url=/user/mypage";
		}
		List<Board> myBoard=boardservice.allMyBoard(user_id);
		//이용권 정보 가져오기
		List<Pass> pass=passservice.getPasses(user_id);
		//자전거 렌탈 정보
		List<Rental> bicycleRent=rentalservice.myRentB(user_id);
		//킥보드 렌탈 정보
		List<Rental> kickboardRent=rentalservice.myRentK(user_id);

		mo.addAttribute("board", myBoard);
		mo.addAttribute("pass", pass);
		mo.addAttribute("bicycle", bicycleRent);
		mo.addAttribute("kickboard", kickboardRent);
		
		return "user/mypage";
	}
	
	@GetMapping("/changePop")
	public String changePop() {
		return "user/changePop";
	}
	
	@PostMapping("/updateUser")
	public String updateUser(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("userUpdate") User user) throws IOException {
		String pw=request.getParameter("user_pw");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		System.out.println(userlogin.getUser_password());
		if(!(pw.equals(userlogin.getUser_password()))) {
			out.println("<script>alert('비밀번호가 일치하지 않습니다!');</script>");
			out.flush();
			return "user/changePop";
		}
		return "user/updateUser";
	}
	@PostMapping("/userUpdate_proc")
	public String userUpdateProc(@Valid @ModelAttribute("userUpdate") User user,BindingResult br, HttpServletResponse response) throws IOException {
		if(br.hasErrors()) {
			return "user/updateUser";
		}else if(!(user.getUser_password().equals(user.getUser_password2()))){
			response.setContentType("text/html;charset=EUC-KR");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('비밀번호 확인을 다시해주세요.');history.go(-1);</script>");
			out.flush();
		}
		userservice.modifyUser(user);
		userlogin.setUser_password(user.getUser_password());
		userlogin.setUser_nickname(user.getUser_nickname());
		userlogin.setUser_phone(user.getUser_phone());
		return "user/userUpdate_proc";
	}
	
	//반납
	@PostMapping("/returnRent")
	public String returnRent(HttpServletRequest request,Model mo) {
		int rental_num=Integer.parseInt(request.getParameter("rental_num"));
		String ride=request.getParameter("ride");
		//난수 6자리 생성
		int dice=0;
		for(int i=1;i<=6;i++) {
			int j;
			if(i==6) {
				j=(int)(Math.random()*9)+1;
			}else {
				j=(int)(Math.random()*10);
			}
			int pow=(int)Math.pow(10, i-1);
			dice+=j*pow;
		}
		System.out.println(dice);
		if(ride.equals("bike")) {
			Rental bikeR=rentalservice.oneRentB(rental_num);
			mo.addAttribute("bikeRental",bikeR);
			mo.addAttribute("ride","자전거");
			mo.addAttribute("dice",dice);
		}else {
			Rental kickR=rentalservice.oneRentK(rental_num);
			mo.addAttribute("kickRental", kickR);
			mo.addAttribute("ride", "킥보드");
			mo.addAttribute("dice",dice);
		}
		return "user/returnRent";
	}
	
	//반납 진행
	@PostMapping("/return_proc")
	public String returnProc(HttpServletRequest request,Model mo) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		int cer_num=Integer.parseInt(request.getParameter("cer_num"));
		int dk=Integer.parseInt(request.getParameter("verify"));
		int renoff_num=Integer.parseInt(request.getParameter("renoff_num"));
		int office_num=rentalservice.officeExist(renoff_num);//대여소 존재여부 확인
		//인증번호 안맞을 때
		if(cer_num!=dk||office_num==0) {
			return "user/proc_fail";
		}
		//자전거 킥보드 여부에 따라 갈라짐
		String kind=request.getParameter("kind");

		request.setAttribute("kind", kind);
		if(kind.equals("자전거")) {
			int bikefee=Integer.parseInt(request.getParameter("bikefee"));

			int bike_num=Integer.parseInt(request.getParameter("bike_num"));
			int rental_num_bike=Integer.parseInt(request.getParameter("b_rental_num"));
			Rental bike=new Rental();
			bike.setBic_num(bike_num);
			bike.setRenoff_num(renoff_num);
			bike.setRental_num(rental_num_bike);
			request.setAttribute("bic_num", bike_num);
			request.setAttribute("renoff_num", renoff_num);
			request.setAttribute("rental_num", rental_num_bike);
			if(bikefee==0) {
				return "forward:/user/returnComplete";
			}else if(bikefee>0) {
				mo.addAttribute("rented",bike);
				mo.addAttribute("kind","bike");
				mo.addAttribute("amount",bikefee);
				return "user/overPay";
			}
		}else if(kind.equals("킥보드")) {
			int kickfee=Integer.parseInt(request.getParameter("kickfee"));

			int kick_num=Integer.parseInt(request.getParameter("kick_num"));
			int rental_num_kick=Integer.parseInt(request.getParameter("k_rental_num"));
			Rental kick=new Rental();
			kick.setKick_num(kick_num);
			kick.setRenoff_num(renoff_num);
			kick.setRental_num(rental_num_kick);
			request.setAttribute("kick_num", kick_num);
			request.setAttribute("renoff_num", renoff_num);
			request.setAttribute("rental_num", rental_num_kick);
			if(kickfee==0) {
				return "forward:/user/returnComplete";
			}else if(kickfee>0) {
				mo.addAttribute("amount",kickfee);
				mo.addAttribute("kind","kick");
				mo.addAttribute("rented",kick);
				return "user/overPay";
			}
		}
		return "user/returnComplete";
	}

	
	@RequestMapping("/returnComplete")
	public String returnComplete(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		String kind=request.getParameter("kind");

		int renoff_num=Integer.parseInt(request.getParameter("renoff_num"));

		if(kind.equals("bike")||kind.equals("자전거")) {
			int bike_num=Integer.parseInt(request.getParameter("bike_num"));
			int rental_num_bike=Integer.parseInt(request.getParameter("b_rental_num"));
			rentalservice.returnBike(rental_num_bike);//자전거 반납(반납날짜에 값 채워넣는 방식)
			rentalservice.changeBikeOffice(renoff_num,bike_num);//배치 대여소 변경
		}else if(kind.equals("kick")||kind.equals("킥보드")) {
			int kick_num=Integer.parseInt(request.getParameter("kick_num"));
			int rental_num_kick=Integer.parseInt(request.getParameter("k_rental_num"));

			rentalservice.returnKick(rental_num_kick);//자전거 반납(반납날짜에 값 채워넣는 방식)
			rentalservice.changeKickOffice(renoff_num,kick_num);//배치 대여소 변경
		}
		return "user/returnComplete";
	}
	
	@RequestMapping("/proc_fail")
	public String procFail() {
		return "user/proc_fail";
	}
	
}
