package com.spring.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.beans.User;

public class UserValidator implements Validator{
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		User usersignin=(User)target;
		
		if(usersignin.isIdExist()== false) {
			errors.rejectValue("user_id", "IdExist");  //해결 필요
		}
	
	}
}
