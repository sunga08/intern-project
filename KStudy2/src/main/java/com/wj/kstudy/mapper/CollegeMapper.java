package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.College;

@Mapper
public interface CollegeMapper {
	public List<College> getAllCollege();
	public List<College> searchCollege(String keyword);
}
