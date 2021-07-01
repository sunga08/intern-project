package com.wj.kstudy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.service.StudyGroupService;

@RestController
public class StudyGroupController {

	@Autowired
	StudyGroupService studyGroupService;
	
	//강의id로 스터디 그룹 목록 조회
	@GetMapping("/lecture/studygroup/{lecId}")
	public List<StudyGroup> showStudyGroup(@PathVariable(name="lecId") String lecId) {
		return studyGroupService.showStudyGroup(lecId);
	}
	
	//스터디 그룹 생성하기
	@PostMapping("/studygroup")
	public int addStudyGroup(HttpSession session, @RequestBody StudyGroup studyGroup) {
		studyGroup.setRegUser(session.getAttribute("user_id").toString());
		return studyGroupService.addStudyGroup(studyGroup);
	}
	
//	@GetMapping("/studygroup/count/{groupId}")
//	public int countMember(@PathVariable(name="groupId") int groupId) {
//		return studyGroupService.countMember(groupId);
//	}
	
	//스터디 참여하기 - 그룹id로 스터디 그룹 정보 가져오기
	@GetMapping("/studygroup/{groupId}")
	public StudyGroup getOneStudyGroup(@PathVariable(name="groupId")int groupId) {
		return studyGroupService.getOneStudyGroup(groupId);
	}
	
	//스터디 참여하기 - 그룹 가입하기
	@PostMapping("/studygroup/join")
	public int addStudyGroupMember(HttpSession session, @RequestBody StudyGroup studyGroup) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.addStudyGroupMember(userId, studyGroup);
	}
	
	@GetMapping("/studygroup/check/{groupId}")
	public int checkAlreadyJoin(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.checkAlreadyJoin(userId, groupId);
	}
	
	
}
