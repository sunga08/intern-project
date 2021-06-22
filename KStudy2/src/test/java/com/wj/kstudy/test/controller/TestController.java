package com.wj.kstudy.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/post")
	public String Test(Model model) {
	
		return "index";
	}
}
