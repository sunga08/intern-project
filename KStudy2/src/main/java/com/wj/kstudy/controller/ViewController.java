package com.wj.kstudy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.dto.Schedule;
import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.UserDto;
import com.wj.kstudy.service.KMoocListService;
import com.wj.kstudy.service.ScheduleService;
import com.wj.kstudy.service.StudyGroupService;
import com.wj.kstudy.service.TestService;

@Controller
public class ViewController {
	
	@Autowired
	TestService testService;
	
	@Autowired
	KMoocListService kmoocListService;
	
	@Autowired
	StudyGroupService studyGroupService;
	
	@Autowired
	ScheduleService scheduleService;
	
	@GetMapping("/post")
	public String test(Model model) {
		UserDto user1 = new UserDto("sunga","pwd1234");
		UserDto user2 = new UserDto("sunga2","pwd12345");
		UserDto user3 = new UserDto("sunga3","pwd123456");
		
		List<UserDto> list = new ArrayList<>();
		
		list.add(user1);
		list.add(user2);
		list.add(user3);
		
		
		model.addAttribute("list",list);
		
		return "test";
	}
	
	@RequestMapping("/test") //mybatis 테스트용
	public ModelAndView test() throws Exception{
		ModelAndView mav = new ModelAndView("test2");
		List<UserDto> userList = testService.selectUser();
		int cnt = testService.countUser();
		
		mav.addObject("list",userList);
		mav.addObject("cnt", cnt);
		mav.setViewName("test2");
		return mav;
	}
	
	@RequestMapping("/main") //메인화면
	public ModelAndView main(HttpSession session) throws Exception{
		String user_id="user1";
		
		session.setAttribute("user_id", user_id);
		session.setMaxInactiveInterval(30*60);
		
		System.out.println(session.getAttribute("user_id").toString());
		
		ModelAndView mav = new ModelAndView("index");
		mav.setViewName("index");
		return mav;
	}
	
	//강의 상세페이지 화면
	@RequestMapping("view/detail") 
	public ModelAndView detail(HttpSession session) {
		String user_id = session.getAttribute("user_id").toString();
		System.out.println(user_id);
		
		ModelAndView mav = new ModelAndView("detail");
		mav.setViewName("detail");
		return mav;
	}
	
//	@GetMapping("/details/{lecId}")
//	public ModelAndView getLectureById(@PathVariable(name="lecId") String id) {
//		Lecture lecture = kmoocListService.getLectureById(id);
//		ModelAndView mav = new ModelAndView("detail");
//		
//		mav.addObject("lecture", lecture);
//
//		mav.setViewName("detail");
//		
//		return mav;
//	}
	
//	@RequestMapping("/studygroup/view/{lecId}") //스터디 그룹 생성 폼
//	public ModelAndView createStudy() {
//		ModelAndView mav = new ModelAndView("createStudyForm");
//		mav.setViewName("createStudyForm");
//		
//		return mav;
//	}
	
	//스터디 그룹 생성 폼
	@RequestMapping("/studygroup/add/{lecId}") 
	public ModelAndView createStudy(@PathVariable(name="lecId") String lecId) {
		Lecture lecture = kmoocListService.getLectureById(lecId);
		
		ModelAndView mav = new ModelAndView("createStudyForm");
		mav.setViewName("createStudyForm");
		mav.addObject("lecture",lecture);
		
		return mav;
	}
	
	//스터디 정보 화면
	@GetMapping("view/info/{groupId}")
	public ModelAndView infoView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		String user_id = session.getAttribute("user_id").toString();
		
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("studyInfo");
		mav.addObject("groupInfo", studyGroup);
		mav.setViewName("detail_studygroup");
		
		return mav;
	}
	
	//스터디 일정관리 화면
	@GetMapping("view/schedule/{groupId}")
	public ModelAndView scheduleView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		//String user_id = session.getAttribute("user_id").toString();
		
		ModelAndView mav = new ModelAndView("scheduleView");
		
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		mav.addObject("groupInfo", studyGroup);
		mav.setViewName("schedule");
		
		return mav;
	}
	
	//스터디 자유게시판 화면
	@GetMapping("view/studyboard/{groupId}")
	public ModelAndView studyBoardView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		String user_id = session.getAttribute("user_id").toString();
		ModelAndView mav = new ModelAndView("studyBoardView");
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		mav.addObject("groupInfo", studyGroup);
		
		mav.setViewName("studyboard");
		
		return mav;
	}
	
	//스터디 정보 수정 폼
	@GetMapping("/studygroup/edit/{groupId}") 
	public ModelAndView updateStudyView(@PathVariable(name="groupId") int groupId) {
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("modifyStudyForm");
		mav.setViewName("modifyStudyForm");
		mav.addObject("studyGroup", studyGroup);
		
		return mav;
	}
	
	//일정 추가 폼
	@GetMapping("view/schedule/add/{groupId}")
	public ModelAndView addScheduleView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("addScheduleView");
		mav.setViewName("addScheduleForm");
		mav.addObject("studyGroup", studyGroup);
		
		return mav;
	}

	//일정 수정 폼
	@GetMapping("view/schedule/edit/{scheduleId}")
	public ModelAndView updateScheduleView(@PathVariable(name="scheduleId") int scheduleId) {
		Schedule schedule = scheduleService.getSchedule(scheduleId);
		
		ModelAndView mav = new ModelAndView("modifyScheduleFrom");
		mav.setViewName("modifyScheduleForm");
		mav.addObject("schedule", schedule);
		
		return mav;
	}

}
