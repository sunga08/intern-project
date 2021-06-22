package com.wj.kstudy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wj.kstudy.dto.UserDto;
import com.wj.kstudy.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
//	@GetMapping("/")
//	public String test0() {
//		return "Hello Spring Boot";
//	}

	@GetMapping("/post")
	public String test(Model model) {
		UserDto user1 = new UserDto("sunga","pwd1234");
		UserDto user2 = new UserDto("sunga2","pwd12345");
		UserDto user3 = new UserDto("sunga3","pwd123456");
		
		List<UserDto> list = new ArrayList<>();
		
		list.add(user1);
		list.add(user2);
		list.add(user3);
		
		
		model.addAttribute("list",list);
		
		return "test";
	}
	
	@RequestMapping("/test")
	public ModelAndView test() throws Exception{
		ModelAndView mav = new ModelAndView("test2");
		List<UserDto> userList = testService.selectUser();
		int cnt = testService.countUser();
		
		mav.addObject("list",userList);
		mav.addObject("cnt", cnt);
		mav.setViewName("test2");
		return mav;
	}
	
	@RequestMapping("/main")
	public ModelAndView main() throws Exception{
		ModelAndView mav = new ModelAndView("index");
		mav.setViewName("index");
		return mav;
	}

}
