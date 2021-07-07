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

import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.User;
import com.wj.kstudy.service.StudyGroupService;

@RestController
public class StudyGroupController {

	@Autowired
	StudyGroupService studyGroupService;
	
	@GetMapping("/login/{userId}")
	public int login(HttpSession session, @PathVariable(name="userId") String userId) {
		//session.setAttribute("user_id", userId);
		return studyGroupService.login(session, userId);			
	}
	
	//강의id로 스터디 그룹 목록 조회
	@GetMapping("lecture/studygroup/{lecId}")
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
	
	//그룹id로 스터디 그룹 정보 가져오기
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
	
	//스터디 참여 가능한 사용자인지 체크
	@GetMapping("/studygroup/check/{groupId}")
	public int checkAlreadyJoin(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.checkAlreadyJoin(userId, groupId);
	}
	
	//그룹에 가입된 사용자인지 체크
	@GetMapping("/studygroup/check/member/{groupId}")
	public int checkGroupMember(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.checkRegMember(groupId, userId);
	}
	
	
	//스터디 정보 수정
	@PutMapping("/studygroup")
	public int updateStudyGroup(@RequestBody StudyGroup studyGroup) {
		return studyGroupService.updateStudyGroup(studyGroup);
	}
	
	//개설자인지 체크
	@GetMapping("/studygroup/check/register/{groupId}")
	public int updateMemberCheck(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.updateMemberCheck(userId, groupId);
	}
	
	//스터디 멤버 조회(개설자 제외)
	@GetMapping("/studygroup/users/{groupId}")
	public List<User> getStudyMembers(@PathVariable(name="groupId")int groupId){
		return studyGroupService.getStudyMembers(groupId);
	}
	
	//스터디 탈퇴
	@DeleteMapping("/studygroup/member/{groupId}")
	public int deleteMember(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.deleteMember(groupId, userId);
	}
	
	//스터디 그룹 삭제
	@PutMapping("/studygroup/{groupId}")
	public int deleteStudyGroup(@PathVariable(name="groupId")int groupId) {
		return studyGroupService.deleteStudyGroup(groupId);
	}
}
