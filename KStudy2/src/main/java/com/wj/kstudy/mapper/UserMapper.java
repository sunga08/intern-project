package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.User;

@Mapper
public interface UserMapper {
	public int insertMember(User user);
	public List<User> getStudyMembers(int groupId);
	public int checkMember(String userId);
}
