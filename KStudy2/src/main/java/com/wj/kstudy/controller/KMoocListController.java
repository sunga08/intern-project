package com.wj.kstudy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.service.KMoocListService;

@RestController

public class KMoocListController {
	@Autowired
	KMoocListService kmoocListService;
	
	@GetMapping("lecture/{category}")
	public List<Lecture> getLectureByCategory(@PathVariable String category) {
		return kmoocListService.getLectureByCategory(category);
	}
	
	@GetMapping("lecture/search/{keyword}")
	public List<Lecture> searchLecture(@PathVariable String keyword){
		return kmoocListService.searchLecture(keyword);
	}
	
	
	@GetMapping("detail/{lecId}")
	public Lecture getLectureById(@PathVariable(name="lecId") String id) {
		return kmoocListService.getLectureById(id);
	}
	

	@GetMapping("lecture/groupcount/{lecId}")
	public int countStudyGroup(@PathVariable(name="lecId") String id) {
		return kmoocListService.countStuduGroup(id);
	}
	
}
