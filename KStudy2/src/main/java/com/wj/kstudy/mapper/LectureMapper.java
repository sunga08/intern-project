package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wj.kstudy.dto.Lecture;

@Mapper
public interface LectureMapper {
	public void insertLecture(Lecture lecture);
	public List<Lecture> getLectureList();
	public List<Lecture> getLectureListPaging(@Param("start") int start, @Param("recordsPerPage") int recordsPerPage);
	public List<Lecture> getLectureByCategory(String category);
	public List<Lecture> getLectureByCategoryPaging(@Param("category") String category, @Param("start") int start, @Param("recordsPerPage") int recordsPerPage);
	public List<Lecture> searchLecture(String keyword);
	public List<Lecture> searchLecturePaging(@Param("keyword") String keyword, @Param("start") int start, @Param("recordsPerPage") int recordsPerPage);
	public Lecture getLectureById(String lecId);
	public int countStudyGroup(String lecId);
	public int countAllLecture();
	public int countCategoryLecture(String category);
	public int countSearchLecture(String keyword);
}
