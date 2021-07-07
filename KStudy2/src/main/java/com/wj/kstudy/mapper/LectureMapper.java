package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.Lecture;

@Mapper
public interface LectureMapper {
	public void insertLecture(Lecture lecture);
	public List<Lecture> getLectureList();
	public List<Lecture> getLectureByCategory(String category);
	public List<Lecture> searchLecture(String keyword);
	public Lecture getLectureById(String lecId);
	public int countStudyGroup(String lecId);
	
}
