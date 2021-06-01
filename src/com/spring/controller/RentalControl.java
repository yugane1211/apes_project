package com.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.beans.Bicycle;
import com.spring.beans.Kickboard;
import com.spring.beans.Pass;
import com.spring.beans.RentalOffice;
import com.spring.beans.User;
import com.spring.service.PassService;
import com.spring.service.RentalService;


@Controller
@RequestMapping("/rental")
public class RentalControl {
	@Autowired
	private RentalService rentalservice;
	@Autowired
	private PassService passservice;
	
	@Resource(name="userlogin")
	private User userlogin;
	
	@GetMapping("/findspot")
	public String findspot(Model mo) {
		//대여소 정보 다 가지고 오기
		List<RentalOffice> rentaloffices=rentalservice.allOffices();
		Iterator<RentalOffice> iter=rentaloffices.iterator();
		while(iter.hasNext()) {
			RentalOffice office=iter.next();
			int bicycles=rentalservice.bicycleCount(office.getRenoff_num());
			int kickboards=rentalservice.kickboardCount(office.getRenoff_num());
			int bicNowRent=rentalservice.bicRented(office.getRenoff_num());
			int kicNowRent=rentalservice.kicRented(office.getRenoff_num());
			office.setRenoff_bic(bicycles-bicNowRent);
			office.setRenoff_kick(kickboards-kicNowRent);
		}
		mo.addAttribute("rentaloffices",rentaloffices);
		return "rental/findspot";
	}
	@GetMapping("/rentalpop")
	public String rentalpop(HttpServletRequest request, Model mo){

		int renoff_num=Integer.parseInt(request.getParameter("renoff_num"));
		//대여소 이름 가져오기
		String renoff_name=rentalservice.getName(renoff_num);
		String user_id=userlogin.getUser_id();
		if(user_id==null||user_id.equals("")) {
			return "rental/needtoLogin";
		}
		//대여소당 자전거, 킥보드 정보 가져오기
		int[] bic=rentalservice.getBikes(renoff_num);
		int[] kic=rentalservice.getKicks(renoff_num);
		//이 대여소에서 빌린 자전거, 킥보드 대수 파악
		int bicNowRent=rentalservice.bicRented(renoff_num);
		int kicNowRent=rentalservice.kicRented(renoff_num);
		//이용권 정보 가져오기
		List<Pass> pass=passservice.getPasses(user_id);
		
		mo.addAttribute("pass", pass);
		mo.addAttribute("renoff_name", renoff_name);
		mo.addAttribute("renoff_num",renoff_num);
		mo.addAttribute("bcount", bic.length-bicNowRent);
		mo.addAttribute("kcount", kic.length-kicNowRent);
		return "rental/rentalpop";
	}
	@PostMapping("/rental_proc")
	public String rentalProc(HttpServletRequest request, Model mo) {
		String pass=request.getParameter("pass");//이용권 종류
		String[] onepass=pass.split(",");
		int pass_num=Integer.parseInt(onepass[0]);
		int pass_time=Integer.parseInt(onepass[1]);//이용권의 이용시간
		String ride=request.getParameter("ride");//탈것 종류
		int renoff_num=Integer.parseInt(request.getParameter("renoff_num"));//히든으로부터 대여소번호 가지고옴
		String user_id=userlogin.getUser_id();
		int rentedD = rentalservice.userRB(user_id)+rentalservice.userRK(user_id);
		if(rentedD!=0) {
			return "rental/rent_fail";
		}
		
		if(ride.equals("bike")) {
			int[] bic=rentalservice.getBikes(renoff_num);//자전거 번호를 얻음
			int k=(int)Math.random()*bic.length;
			int bic_num=bic[k];
			rentalservice.insertBicRent(bic_num,user_id,pass_time);//자전거렌탈 테이블에 정보 추가
			if(onepass.length<=2) {//이용권 사용시작날짜가 null일 경우
				passservice.updateStart(pass_num);//이용권 시작시간에 추가(update)
			}

			//반납시 이 번호를 다시 등록해야 함
			
			return "rental/rental_proc";
		}else if(ride.equals("kick")) {
			int[] kic=rentalservice.getKicks(renoff_num);//킥보드 번호를 얻음
			int k=(int)Math.random()*kic.length;
			int kic_num=kic[k];
			rentalservice.insertKicRent(kic_num,user_id,pass_time);//킥보드렌탈 테이블에 정보 추가
			if(onepass.length<=2) {
				passservice.updateStart(pass_num);
			}
			//반납시 이 번호를 다시 등록해야 함
			
			return "rental/rental_proc";
		}
		return "rental/rental_proc";
	}
	
	
	
	
}
