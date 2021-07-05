package com.wj.kstudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.Schedule;
import com.wj.kstudy.mapper.ScheduleMapper;

@Service
public class ScheduleService {
	
	@Autowired
	ScheduleMapper scheduleMapper;
	
	public List<Schedule> getScheduleList(int groupId){
		return scheduleMapper.getScheduleList(groupId);
	}
	
	public int addSchedule(Schedule schedule) {
		return scheduleMapper.addSchedule(schedule);
	}
	
	public int deleteSchedule(int scheduleId) {
		return scheduleMapper.deleteSchedule(scheduleId);
	}
	
	public int updateSchedule(Schedule Schedule) {
		return scheduleMapper.updateSchedule(Schedule);
	}
	
	public Schedule getSchedule(int scheduleId) {
		return scheduleMapper.getSchedule(scheduleId);
	}
}
