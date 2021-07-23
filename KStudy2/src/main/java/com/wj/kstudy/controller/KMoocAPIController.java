package com.wj.kstudy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.dto.ListDto;
import com.wj.kstudy.service.KMoocAPIService;
import com.wj.kstudy.service.KMoocListService;

import ch.qos.logback.classic.Logger;

@RestController
public class KMoocAPIController {
	
	@Autowired
	KMoocAPIService kmoocAPIService;
	
	
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
		Object response = kmoocAPIService.getItemsFromOpenApi(Page);
		return response;
	}
	
	@GetMapping("/getData2")
	public String getData2(@RequestBody ListDto request) throws JsonProcessingException, UnsupportedEncodingException {
		int Page = request.getPage();
		return kmoocAPIService.getItemsFromOpenApi2(Page);
	}
	
	@GetMapping("/insertData")
	public void insertData() throws JsonProcessingException, UnsupportedEncodingException {
		kmoocAPIService.apiTest();
		
	}
		

	
}
