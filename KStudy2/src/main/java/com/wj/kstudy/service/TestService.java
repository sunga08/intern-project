package com.wj.kstudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.UserDto;
import com.wj.kstudy.mapper.TestMapper;

@Service
public class TestService {
	@Autowired
	public TestMapper mapper;
	
	public List<UserDto> selectUser(){
		return mapper.selectUser();
	}
	
	public int countUser() {
		return mapper.countUser();
	}
}
