package com.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beans.Bicycle;
import com.spring.beans.Kickboard;
import com.spring.beans.Rental;
import com.spring.beans.RentalOffice;
import com.spring.database.RentalMapper;

@Repository
public class RentalDao {
	@Autowired
	private RentalMapper rentalmapper;
	
	public int bicycleCount(int renoff_num) {
		return rentalmapper.bicycleCount(renoff_num);
	}
	
	public int kickboardCount(int renoff_num) {
		return rentalmapper.kickboardCount(renoff_num);
	}
	
	public List<RentalOffice> allOffices(){
		return rentalmapper.allOffices();
	}
	/////rentalpop
	public int[] getBikes(int renoff_num){
		return rentalmapper.getBikes(renoff_num);
	}
	public int[] getKicks(int renoff_num){
		return rentalmapper.getKicks(renoff_num);
	}
	public String getName(int renoff_num) {
		return rentalmapper.getName(renoff_num);
	}
	
	public int bicRented(int renoff_num) {
		return rentalmapper.bicRented(renoff_num);
	}
	public int kicRented(int renoff_num) {
		return rentalmapper.kicRented(renoff_num);
	}
	
	//rental_proc
	public void insertBicRent(int bic_num,String user_id, int pass_time) {
		rentalmapper.insertBicRent(bic_num,user_id,pass_time);
	}
	public void insertKicRent(int kic_num,String user_id, int pass_time) {
		rentalmapper.insertKicRent(kic_num,user_id,pass_time);
	}
	
	
	//mypage
	public List<Rental> myRentB(String user_id){
		return rentalmapper.myRentB(user_id);
	}
	public List<Rental> myRentK(String user_id){
		return rentalmapper.myRentK(user_id);
	}
	
	//특정 렌탈 가져오기
	public Rental oneRentB(int rental_num) {
		return rentalmapper.oneRentB(rental_num);
	}
	public Rental oneRentK(int rental_num) {
		return rentalmapper.oneRentK(rental_num);
	}
	
	
	
	//특정 사용자가 빌린 장비 대수
	public int userRB(String user_id) {
		return rentalmapper.userRB(user_id);
	}
	public int userRK(String user_id) {
		return rentalmapper.userRK(user_id);
	}
	
	
	
	
	//반납
	//대여소 번호 존재여부 확인
	public int officeExist(int renoff_num) {
		return rentalmapper.officeExist(renoff_num);
	}
	
	//자전거, 킥보드 반납
	public void returnBike(int rental_num) {
		rentalmapper.returnBike(rental_num);
	}
	public void returnKick(int rental_num) {
		rentalmapper.returnKick(rental_num);
	}
	//대여소 위치 변경
	public void changeBikeOffice(int renoff_num,int bic_num) {
		rentalmapper.changeBikeOffice(renoff_num,bic_num);
	}
	public void changeKickOffice(int renoff_num,int kick_num) {
		rentalmapper.changeKickOffice(renoff_num,kick_num);
	}
}
