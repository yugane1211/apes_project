package com.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.beans.User;

@Controller
public class StartControl {
	@Resource(name="userlogin")
	private User userlogin;
	
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String start(HttpSession session) {
		session.setAttribute("userlogin", userlogin);
		return "main";
	}
	
	@GetMapping("/tour01")
	public String tour() {
		return "tour01";
	}
	@GetMapping("/tour_han")
	public String tourHan() {
		return "tour_han";
	}
	@GetMapping("/tour_park")
	public String tourPark() {
		return "tour_park";
	}	
	@GetMapping("/tour_fourdoors")
	public String tourFourdoors() {
		return "tour_fourdoors";
	}	
	@GetMapping("/tour_ddm")
	public String tourDdm() {
		return "tour_ddm";
	}	
	@GetMapping("/guide")
	public String guide(){
		return "guide";
	}
}
