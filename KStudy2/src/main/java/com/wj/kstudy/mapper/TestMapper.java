package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.wj.kstudy.dto.UserDto;

@Repository
@Mapper
public interface TestMapper {
	public List<UserDto> selectUser();
	public int countUser();
}
