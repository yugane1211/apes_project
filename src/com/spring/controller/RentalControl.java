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
		//�뿩�� ���� �� ������ ����
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
		//�뿩�� �̸� ��������
		String renoff_name=rentalservice.getName(renoff_num);
		String user_id=userlogin.getUser_id();
		if(user_id==null||user_id.equals("")) {
			return "rental/needtoLogin";
		}
		//�뿩�Ҵ� ������, ű���� ���� ��������
		int[] bic=rentalservice.getBikes(renoff_num);
		int[] kic=rentalservice.getKicks(renoff_num);
		//�� �뿩�ҿ��� ���� ������, ű���� ��� �ľ�
		int bicNowRent=rentalservice.bicRented(renoff_num);
		int kicNowRent=rentalservice.kicRented(renoff_num);
		//�̿�� ���� ��������
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
		String pass=request.getParameter("pass");//�̿�� ����
		String[] onepass=pass.split(",");
		int pass_num=Integer.parseInt(onepass[0]);
		int pass_time=Integer.parseInt(onepass[1]);//�̿���� �̿�ð�
		String ride=request.getParameter("ride");//Ż�� ����
		int renoff_num=Integer.parseInt(request.getParameter("renoff_num"));//�������κ��� �뿩�ҹ�ȣ �������
		String user_id=userlogin.getUser_id();
		int rentedD = rentalservice.userRB(user_id)+rentalservice.userRK(user_id);
		if(rentedD!=0) {
			return "rental/rent_fail";
		}
		
		if(ride.equals("bike")) {
			int[] bic=rentalservice.getBikes(renoff_num);//������ ��ȣ�� ����
			int k=(int)Math.random()*bic.length;
			int bic_num=bic[k];
			rentalservice.insertBicRent(bic_num,user_id,pass_time);//�����ŷ�Ż ���̺� ���� �߰�
			if(onepass.length<=2) {//�̿�� �����۳�¥�� null�� ���
				passservice.updateStart(pass_num);//�̿�� ���۽ð��� �߰�(update)
			}

			//�ݳ��� �� ��ȣ�� �ٽ� ����ؾ� ��
			
			return "rental/rental_proc";
		}else if(ride.equals("kick")) {
			int[] kic=rentalservice.getKicks(renoff_num);//ű���� ��ȣ�� ����
			int k=(int)Math.random()*kic.length;
			int kic_num=kic[k];
			rentalservice.insertKicRent(kic_num,user_id,pass_time);//ű���巻Ż ���̺� ���� �߰�
			if(onepass.length<=2) {
				passservice.updateStart(pass_num);
			}
			//�ݳ��� �� ��ȣ�� �ٽ� ����ؾ� ��
			
			return "rental/rental_proc";
		}
		return "rental/rental_proc";
	}
	
	
	
	
}
