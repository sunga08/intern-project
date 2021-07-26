package com.wj.kstudy.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.User;
import com.wj.kstudy.mapper.UserMapper;

@Service
public class LoginService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public int login(HttpSession httpSession, String userId) {
		if(userMapper.checkMember(userId)==1) { //가입된 회원
			httpSession.setAttribute("user_id", userId);
			
			System.out.println("로그인:"+httpSession.getAttribute("user_id").toString());
			return 1;
		}
		else {
			return 0;
		}
	}
	
	public void signup(HttpSession session) {
		User user = null;
		String email = session.getAttribute("user_id").toString();
		String encodedEmail = passwordEncoder.encode(email);
		System.out.println("sign up email:"+email);
		System.out.println("sign up encode:"+encodedEmail);
		
		
		if(userMapper.checkMember(session.getAttribute("user_id").toString())!=1) { //가입되지 않은 회원
			user.setUserId(encodedEmail);
			user.setUserName(session.getAttribute("nickname").toString());
			userMapper.insertMember(user);	
			System.out.println("회원가입:"+user.getUserName());
		}
		
		else {
			System.out.println("가입된 회원");
		}

	}
}
