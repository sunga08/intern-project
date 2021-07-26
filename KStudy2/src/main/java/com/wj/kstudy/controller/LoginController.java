package com.wj.kstudy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.wj.kstudy.NaverLoginBO;
import com.wj.kstudy.service.LoginService;
import com.wj.kstudy.service.StudyGroupService;

@RestController
public class LoginController {

	@Autowired
	StudyGroupService studyGroupService;
	
	@Autowired
	LoginService loginService;
	

	//DB에 있는 사용자인지 체크
	@GetMapping("/login/{userId}")
	public int login(HttpSession session, @PathVariable(name="userId") String userId) {
		return loginService.login(session, userId);			
	}

	
	@GetMapping("/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("user_id");
		session.invalidate();
	}
	
	

}
