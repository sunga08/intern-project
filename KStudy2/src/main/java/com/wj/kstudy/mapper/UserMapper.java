package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.User;

@Mapper
public interface UserMapper {
	public List<User> getStudyMembers(int groupId);
}
