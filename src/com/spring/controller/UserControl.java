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
	
	//��ȿ�� �˻��ϴ� Ŭ���� ���
	@Autowired
	private UserValidator validator;
	
	
	
	//���ο��� �α��ι�ư ������
	@GetMapping("/login")
	public String login(@ModelAttribute("tempuserlogin") User user, HttpServletRequest request, Model mo) {
		String url=request.getParameter("url");
		mo.addAttribute("url",url);
		return "user/login";
	}
	
	//�α׾ƿ�
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		String url=request.getParameter("url");
		userlogin.setUser_login(false);
		userlogin.setUser_id("");
		userlogin.setUser_nickname("");
		userlogin.setUser_phone("");
		userlogin.setUser_password("");//�α׾ƿ��� �� �κ� ��������

		
		return "redirect:/"+url;
	}
	
	//���ο��� ȸ�����Թ�ư ������
	@GetMapping("/signin")
	public String signin(@ModelAttribute("usersignin") User user) {
		return "user/signin";
	}
	
	//ȸ������â���� �Է� �� ��ư ������
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
	
	//�α���â���� �Է� �� ��ư ������
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
	
	//���ã�� �������� �̵�
	@GetMapping("/find")
	public String find() {
		return "user/find";
	}
	
	//��ȣ �Է� �� �ش� ��ȣ�κ��� �̸��� ã��
	@PostMapping("/emailfind")
	public String emailfind(HttpServletRequest request, Model mo) {
		String phone=request.getParameter("phone");
		List<String> emails=userservice.findEmail(phone);
		int ea=emails.size();
		mo.addAttribute("email", emails);
		mo.addAttribute("re",ea);
		return "user/emailfind";
	}
	//javamailsender ��������(������ �������)
	@Resource(name="emailS")
	private MailBean mailSender;
	//���� ���� ������
	@PostMapping("/emailsend")
	public ModelAndView certi_email(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//�̸��ϰ� ���������
		String e_mail=request.getParameter("user_id");

		//���� 6�ڸ� ����
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
		//���� �̸��� ����
		String setfrom="yugane1737@gmail.com";
		String title="[Ȥ��Ż��]��й�ȣ ã�� ���� �����Դϴ�.";
		String content=System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                        
                "�ȳ��ϼ��� ȸ���� Ȥ��Ż���� ã���ּż� �����մϴ�"
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
        
                "��й�ȣ ã�� ������ȣ�� " +email_dice+ " �Դϴ�. "
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "������ ������ȣ�� Ȩ�������� �Է��� �ֽø� �������� �Ѿ�ϴ�.";
		
		
		//�̸��� ������ ���� try-catch
		try {
			
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
            messageHelper.setTo(e_mail); // �޴»�� �̸���
            messageHelper.setSubject(title); // ���������� ������ �����ϴ�
            messageHelper.setText(content); // ���� ����
            
            mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//���� ���������� ������ �� �����Ϳ� ��� �� �̸� ����
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user/emailsend");
		
		request.setAttribute("email", e_mail);
		mv.addObject("dice",email_dice);
		return mv;
	}
	
	//������ȣ Ȯ�� �� ��ġ�� ���ο� ��й�ȣ �Է��Ϸ�
	@PostMapping("/mailconfig")
	public String mailconfig(HttpServletResponse response, HttpServletRequest request, ModelAndView mo, @ModelAttribute("passwordUpdate") User user) throws IOException {
		String input_conf=request.getParameter("press");
		String dice=request.getParameter("dice");
		String user_id=request.getParameter("email");

		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		
		if(input_conf.equals(dice)) {
			user.setUser_id(user_id);

			out.println("<script>alert('���� �Ϸ�');</script>");
			out.flush();
			return "user/mailconfig";
		}else {

			out.println("<script>alert('������ȣ�� ��ġ���� �ʽ��ϴ�.'); history.go(-1);</script>");
			out.flush();
			return "user/emailsend";
		}
	}
	
	//���ο� ��й�ȣ�� �Է��ؼ� DB�� ������Ʈ
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
		//�̿�� ���� ��������
		List<Pass> pass=passservice.getPasses(user_id);
		//������ ��Ż ����
		List<Rental> bicycleRent=rentalservice.myRentB(user_id);
		//ű���� ��Ż ����
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
			out.println("<script>alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�!');</script>");
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
			out.println("<script>alert('��й�ȣ Ȯ���� �ٽ����ּ���.');history.go(-1);</script>");
			out.flush();
		}
		userservice.modifyUser(user);
		userlogin.setUser_password(user.getUser_password());
		userlogin.setUser_nickname(user.getUser_nickname());
		userlogin.setUser_phone(user.getUser_phone());
		return "user/userUpdate_proc";
	}
	
	//�ݳ�
	@PostMapping("/returnRent")
	public String returnRent(HttpServletRequest request,Model mo) {
		int rental_num=Integer.parseInt(request.getParameter("rental_num"));
		String ride=request.getParameter("ride");
		//���� 6�ڸ� ����
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
			mo.addAttribute("ride","������");
			mo.addAttribute("dice",dice);
		}else {
			Rental kickR=rentalservice.oneRentK(rental_num);
			mo.addAttribute("kickRental", kickR);
			mo.addAttribute("ride", "ű����");
			mo.addAttribute("dice",dice);
		}
		return "user/returnRent";
	}
	
	//�ݳ� ����
	@PostMapping("/return_proc")
	public String returnProc(HttpServletRequest request,Model mo) throws IOException {
		request.setCharacterEncoding("EUC-KR");
		int cer_num=Integer.parseInt(request.getParameter("cer_num"));
		int dk=Integer.parseInt(request.getParameter("verify"));
		int renoff_num=Integer.parseInt(request.getParameter("renoff_num"));
		int office_num=rentalservice.officeExist(renoff_num);//�뿩�� ���翩�� Ȯ��
		//������ȣ �ȸ��� ��
		if(cer_num!=dk||office_num==0) {
			return "user/proc_fail";
		}
		//������ ű���� ���ο� ���� ������
		String kind=request.getParameter("kind");

		request.setAttribute("kind", kind);
		if(kind.equals("������")) {
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
		}else if(kind.equals("ű����")) {
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

		if(kind.equals("bike")||kind.equals("������")) {
			int bike_num=Integer.parseInt(request.getParameter("bike_num"));
			int rental_num_bike=Integer.parseInt(request.getParameter("b_rental_num"));
			rentalservice.returnBike(rental_num_bike);//������ �ݳ�(�ݳ���¥�� �� ä���ִ� ���)
			rentalservice.changeBikeOffice(renoff_num,bike_num);//��ġ �뿩�� ����
		}else if(kind.equals("kick")||kind.equals("ű����")) {
			int kick_num=Integer.parseInt(request.getParameter("kick_num"));
			int rental_num_kick=Integer.parseInt(request.getParameter("k_rental_num"));

			rentalservice.returnKick(rental_num_kick);//������ �ݳ�(�ݳ���¥�� �� ä���ִ� ���)
			rentalservice.changeKickOffice(renoff_num,kick_num);//��ġ �뿩�� ����
		}
		return "user/returnComplete";
	}
	
	@RequestMapping("/proc_fail")
	public String procFail() {
		return "user/proc_fail";
	}
	
}
