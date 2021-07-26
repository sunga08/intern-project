package com.wj.kstudy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.service.KMoocListService;

@RestController

public class KMoocListController {
	@Autowired
	KMoocListService kmoocListService;
	
	
	@GetMapping("lecture")
	public List<Lecture> getLectureList(){
		return kmoocListService.getLectureList();
	}
	

	@GetMapping("lecture/{page}")
	public List<Lecture> getLectureListPaging(@PathVariable(name="page")int page, @ModelAttribute("criteria") Criteria criteria){
		criteria.setCurrentPageNo(page);
		return kmoocListService.getLectureListPaging(criteria);
	}
	
	@GetMapping("lecture/{category}/{page}")
	public List<Lecture> getLectureByCategory(@PathVariable(name="category") String category, @PathVariable(name="page")int page, @ModelAttribute("criteria") Criteria criteria) {
		criteria.setCurrentPageNo(page);
		return kmoocListService.getLectureByCategoryPaging(category, criteria);
	}
	
	@GetMapping("lecture/search/{keyword}/{page}")
	public List<Lecture> searchLecture(@PathVariable(name="keyword") String keyword, @PathVariable(name="page")int page, @ModelAttribute("criteria") Criteria criteria){
		criteria.setCurrentPageNo(page);
		return kmoocListService.searchLecturePaging(keyword, criteria);
	}
	
	
	@GetMapping("detail/{lecId}")
	public Lecture getLectureById(@PathVariable(name="lecId") String id) {
		return kmoocListService.getLectureById(id);
	}
	

	@GetMapping("lecture/groupcount/{lecId}")
	public int countStudyGroup(@PathVariable(name="lecId") String id) {
		return kmoocListService.countStudyGroup(id);
	}
	
	@GetMapping("lecture/count")
	public int countAllLecture() {
		return kmoocListService.countAllLecture();
	}
	
	@GetMapping("lecture/count/{category}")
	public int countCategoryLecture(@PathVariable(name="category") String category) {
		return kmoocListService.countCategoryLecture(category);
	}
	
	@GetMapping("search/count/{keyword}")
	public int countSearchLecture(@PathVariable(name="keyword") String keyword) {
		return kmoocListService.countSearchLecture(keyword);
	}
	
}
