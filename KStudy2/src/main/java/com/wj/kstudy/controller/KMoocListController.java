package com.wj.kstudy.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wj.kstudy.dto.ListDto;
import com.wj.kstudy.service.KMoocListService;

@RestController
public class KMoocListController {
	
	@Autowired
	KMoocListService kmoocListService;
	
//	@GetMapping("/apiTest")
//	public String toHome() {
//		return "home";
//	}
	
	@GetMapping("/apiTest")
	public ModelAndView toHome() {
		ModelAndView model = new ModelAndView("home");
		return model;
	}
	
	@PostMapping("/getData")
	public Object getData(@RequestBody ListDto request) throws UnsupportedEncodingException{
		int Page = request.getPage();
		Object response = kmoocListService.getItemsFromOpenApi(Page);
		return response;
	}
	
}
