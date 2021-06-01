package com.spring.database;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.beans.Bicycle;
import com.spring.beans.Kickboard;
import com.spring.beans.Rental;
import com.spring.beans.RentalOffice;

public interface RentalMapper {
	//각각 자전거와 킥보드의 대여소별 댓수 가져오기
	@Select("select count(*) from bicycle natural join rental_office where renoff_num=#{renoff_num}")
	public int bicycleCount(int renoff_num);
	@Select("select count(*) from kickboard natural join rental_office where renoff_num=#{renoff_num}")
	public int kickboardCount(int renoff_num);
	
	//대여소 정보 모두 가져오기
	@Select("select * from rental_office order by renoff_num asc")
	public List<RentalOffice> allOffices();
	
	//각 대여소에 배치된 자전거 가져오기
	@Select("select bic_num from bicycle where renoff_num=#{renoff_num}")
	public int[] getBikes(int renoff_num);
	
	//각 대여소에 배치된 킥보드 가져오기
	@Select("select kick_num from kickboard where renoff_num=#{renoff_num}")
	public int[] getKicks(int renoff_num);
	
	//각 대여소 이름 가져오기
	@Select("select renoff_name from rental_office where renoff_num=#{renoff_num}")
	public String getName(int renoff_num);
	
	//자전거렌탈 테이블에 삽입
	@Insert("insert into rental_bicycle values(rental_seq.nextval,#{param1},#{param2},sysdate,null,#{param3})")
	public void insertBicRent(int bic_num,String user_id, int pass_time);
	
	//킥보드렌탈 테이블에 삽입
	@Insert("insert into rental_kickboard values(rental_seq.nextval,#{param1},#{param2},sysdate,null,#{param3})")
	public void insertKicRent(int kic_num,String user_id, int pass_time);
	
	//각 대여소에서 빌린 자전거 대수 파악
	@Select("select count(*) from bicycle natural join rental_bicycle where renoff_num=#{param1} and rental_finish is null")
	public int bicRented(int renoff_num);
	
	//각 대여소에서 빌린 킥보드 대수 파악
	@Select("select count(*) from kickboard natural join rental_kickboard where renoff_num=#{param1} and rental_finish is null")
	public int kicRented(int renoff_num);
	
	//특정 사용자가 렌탈한 정보 모두 가져오기
	
	@Select("select bicycle.bic_num,rental_num,renoff_name,rental_start,rental_finish,rental_time,ROUND((sysdate-rental_start)*24*60) as using_time, ROUND((sysdate-rental_start)*24*60)-rental_time as over_time from rental_bicycle, bicycle,rental_office where rental_bicycle.bic_num=bicycle.bic_num and bicycle.renoff_num=rental_office.renoff_num and user_id=#{param1} and rental_finish is null")
	public List<Rental> myRentB(String user_id);
	@Select("select kickboard.kick_num,rental_num,renoff_name,rental_start,rental_finish,rental_time,ROUND((sysdate-rental_start)*24*60) as using_time, ROUND((sysdate-rental_start)*24*60)-rental_time as over_time from rental_kickboard, kickboard,rental_office where rental_kickboard.kick_num=kickboard.kick_num and kickboard.renoff_num=rental_office.renoff_num and user_id=#{param1} and rental_finish is null")
	public List<Rental> myRentK(String user_id);
	
	//특정 렌탈번호로 가져오게
	@Select("select bic_num,rental_num,rental_start,rental_finish,rental_time,ROUND((sysdate-rental_start)*24*60) as using_time, ROUND((sysdate-rental_start)*24*60)-(select rental_time from rental_bicycle where rental_num=#{param1}) as over_time from rental_bicycle where rental_num=#{param1}")
	public Rental oneRentB(int rental_num);
	@Select("select kick_num,rental_num,rental_start,rental_finish,rental_time,ROUND((sysdate-rental_start)*24*60) as using_time, ROUND((sysdate-rental_start)*24*60)-(select rental_time from rental_kickboard where rental_num=#{param1}) as over_time from rental_kickboard where rental_num=#{param1}")
	public Rental oneRentK(int rental_num);
	
	
	//반납
	//대여소 번호 존재여부 확인
	@Select("select count(*) from rental_office where renoff_num=#{param1}")
	public int officeExist(int renoff_num);
	
	@Update("update rental_bicycle set rental_finish=sysdate, rental_time=ROUND((sysdate-(select rental_start from rental_bicycle where rental_num=#{param1}))*24*60) where rental_num=#{param1}")
	public void returnBike(int rental_num);
	@Update("update rental_kickboard set rental_finish=sysdate, rental_time=ROUND((sysdate-(select rental_start from rental_kickboard where rental_num=#{param1}))*24*60) where rental_num=#{param1}")
	public void returnKick(int rental_num);	
	
	@Update("update bicycle set renoff_num=#{param1} where bic_num=#{param2}")
	public void changeBikeOffice(int renoff_num, int bic_num);
	@Update("update kickboard set renoff_num=#{param1} where kick_num=#{param2}")
	public void changeKickOffice(int renoff_num, int kick_num);	
}
