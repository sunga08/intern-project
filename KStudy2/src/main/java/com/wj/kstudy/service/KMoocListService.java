package com.wj.kstudy.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.Board;
import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.mapper.LectureMapper;

@Service
public class KMoocListService {

	@Autowired
	private LectureMapper lectureMapper;
	
	@Value("12")
	private int PAGE_SIZE;
	
	public List<Lecture> getLectureList(){
		return lectureMapper.getLectureList();
	}
	
	public List<Lecture> getLectureListPaging(Criteria criteria){
		int totalCount = lectureMapper.countAllLecture();
		criteria.setRecordsPerPage(12);
		criteria.setTotalData(totalCount);
		
		List<Lecture> lectureList = Collections.emptyList();
		int start = criteria.getStartPage(); //offset
		
		if(totalCount>0) {
			lectureList = lectureMapper.getLectureListPaging(start, PAGE_SIZE);
		}
		
		System.out.println("total: "+criteria.getTotalData());
		
		return lectureList;
	}
	
	public List<Lecture> getLectureByCategory(String category) {
		return lectureMapper.getLectureByCategory(category);
	}
	
	public List<Lecture> getLectureByCategoryPaging(String category, Criteria criteria) {
		int totalCount = lectureMapper.countCategoryLecture(category);
		criteria.setRecordsPerPage(12);
		criteria.setTotalData(totalCount);
		
		List<Lecture> lectureList = Collections.emptyList();
		int start = criteria.getStartPage(); //offset
		
		if(totalCount>0) {
			lectureList = lectureMapper.getLectureByCategoryPaging(category, start, PAGE_SIZE);
		}
		
		
		return lectureList;
	}
	
	public List<Lecture> searchLecture(String keyword){
		return lectureMapper.searchLecture(keyword);
	}
	
	public List<Lecture> searchLecturePaging(String keyword, Criteria criteria){
		int totalCount = lectureMapper.countSearchLecture(keyword);
		criteria.setRecordsPerPage(12);
		criteria.setTotalData(totalCount);
		
		List<Lecture> lectureList = Collections.emptyList();
		int start = criteria.getStartPage(); //offset
		
		if(totalCount>0) {
			lectureList = lectureMapper.searchLecturePaging(keyword, start, PAGE_SIZE);
		}
				
		return lectureList;
	}
	
	
	public Lecture getLectureById(String lecId) {
		return lectureMapper.getLectureById(lecId);
	}
	
	public int countStudyGroup(String lecId) {
		return lectureMapper.countStudyGroup(lecId);
	}
	
	public int countAllLecture() {
		return lectureMapper.countAllLecture();
	}
	
	public int countCategoryLecture(String category) {
		return lectureMapper.countCategoryLecture(category);
	}
	
	public int countSearchLecture(String keyword) {
		return lectureMapper.countSearchLecture(keyword);
	}
}
