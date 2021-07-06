package com.wj.kstudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.mapper.LectureMapper;

@Service
public class KMoocListService {

	@Autowired
	private LectureMapper lectureMapper;
	
	public List<Lecture> getLectureByCategory(String category) {
		return lectureMapper.getLectureByCategory(category);
	}
	
	public List<Lecture> searchLecture(String keyword){
		return lectureMapper.searchLecture(keyword);
	}
	
	public Lecture getLectureById(String lecId) {
		return lectureMapper.getLectureById(lecId);
	}
	
	public int countStuduGroup(String lecId) {
		return lectureMapper.countStudyGroup(lecId);
	}
}
