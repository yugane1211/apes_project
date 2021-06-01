package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beans.Bicycle;
import com.spring.beans.Kickboard;
import com.spring.beans.Rental;
import com.spring.beans.RentalOffice;
import com.spring.dao.RentalDao;


@Service
public class RentalService {
	@Autowired
	private RentalDao rentaldao;
	
	public int bicycleCount(int renoff_num) {
		return rentaldao.bicycleCount(renoff_num);
	}
	
	public int kickboardCount(int renoff_num) {
		return rentaldao.kickboardCount(renoff_num);
	}
	
	public List<RentalOffice> allOffices(){
		return rentaldao.allOffices();
	}
	
	
	/////rentalpop
	public int[] getBikes(int renoff_num){
		return rentaldao.getBikes(renoff_num);
	}
	public int[] getKicks(int renoff_num){
		return rentaldao.getKicks(renoff_num);
	}
	
	public String getName(int renoff_num) {
		return rentaldao.getName(renoff_num);
	}
	public int bicRented(int renoff_num) {
	    return rentaldao.bicRented(renoff_num);
	}
	public int kicRented(int renoff_num) {
		return rentaldao.kicRented(renoff_num);
	}
	
	//rental_proc
	public void insertBicRent(int bic_num,String user_id,int pass_time) {
		rentaldao.insertBicRent(bic_num,user_id,pass_time);
	}
	public void insertKicRent(int kic_num,String user_id, int pass_time) {
		rentaldao.insertKicRent(kic_num,user_id,pass_time);
	}
	//mypage
	public List<Rental> myRentB(String user_id){
		return rentaldao.myRentB(user_id);
	}
	public List<Rental> myRentK(String user_id){
		return rentaldao.myRentK(user_id);
	}

	//특정 렌탈 가져오기
	public Rental oneRentB(int rental_num) {
		return rentaldao.oneRentB(rental_num);
	}
	public Rental oneRentK(int rental_num) {
		return rentaldao.oneRentK(rental_num);
	}
	
	
	//특정 사용자가 빌린 장비 대수
	public int userRB(String user_id) {
		return rentaldao.userRB(user_id);
	}
	public int userRK(String user_id) {
		return rentaldao.userRK(user_id);
	}
	
	
	
	
	
	//반납
	//대여소 번호 존재여부 확인
	public int officeExist(int renoff_num) {
		return rentaldao.officeExist(renoff_num);
	}	
	
	//자전거, 킥보드 반납
	public void returnBike(int rental_num) {
		rentaldao.returnBike(rental_num);
	}
	public void returnKick(int rental_num) {
		rentaldao.returnKick(rental_num);
	}
	//대여소 위치 변경
	public void changeBikeOffice(int renoff_num,int bic_num) {
		rentaldao.changeBikeOffice(renoff_num,bic_num);
	}
	public void changeKickOffice(int renoff_num,int kick_num) {
		rentaldao.changeKickOffice(renoff_num,kick_num);
	}
}
