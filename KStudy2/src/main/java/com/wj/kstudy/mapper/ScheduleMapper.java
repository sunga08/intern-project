package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.Schedule;

@Mapper
public interface ScheduleMapper {
	public List<Schedule> getScheduleList(int groupId);
	public Schedule getSchedule(int scheduleId);
	public int addSchedule(Schedule schedule);
	public int deleteSchedule(int scheduleId);
	public int updateSchedule(Schedule schedule);
}
