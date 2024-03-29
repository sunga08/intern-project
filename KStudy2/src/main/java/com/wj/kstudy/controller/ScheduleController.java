package com.wj.kstudy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.wj.kstudy.dto.Schedule;
import com.wj.kstudy.service.ScheduleService;

@RestController
public class ScheduleController {
	
	@Autowired 
	ScheduleService scheduleService;
	
	@GetMapping("/schedule/{groupId}")
	public List<Schedule> getScheduleList(@PathVariable(name="groupId")int groupId){
		return scheduleService.getScheduleList(groupId);
	}
	
	//일정 등록
	@PostMapping("/schedule")
	public int addSchedule(HttpSession session, @RequestBody Schedule schedule) {
		schedule.setRegUser(session.getAttribute("nickname").toString());
		return scheduleService.addSchedule(schedule);
	}
	
	//일정 삭제
	@DeleteMapping("/schedule/{scheduleId}")
	public int deleteSchedule(@PathVariable(name="scheduleId") int scheduleId) {
		return scheduleService.deleteSchedule(scheduleId);
	}
	
	//일정 수정
	@PutMapping("/schedule")
	public int updateSchedule(@RequestBody Schedule schedule) {		
		return scheduleService.updateSchedule(schedule);
	}
	
}
