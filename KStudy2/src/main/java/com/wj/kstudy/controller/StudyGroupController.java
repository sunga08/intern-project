package com.wj.kstudy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.wj.kstudy.dto.College;
import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.User;
import com.wj.kstudy.service.StudyGroupService;

@RestController
public class StudyGroupController {

	@Autowired
	StudyGroupService studyGroupService;
	
	
	//강의id로 스터디 그룹 목록 조회
	@GetMapping("lecture/studygroup/{lecId}")
	public List<StudyGroup> showStudyGroup(@PathVariable(name="lecId") String lecId) {
		return studyGroupService.showStudyGroup(lecId);
	}
	
	@GetMapping("lecture/studygroup/{lecId}/{page}")
	public List<StudyGroup> getStudyGroupPaging(@PathVariable(name="lecId") String lecId, @PathVariable(name="page") int page, @ModelAttribute("criteria") Criteria criteria) {
		criteria.setCurrentPageNo(page);
		return studyGroupService.getStudyGroupPaging(lecId, criteria);
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
		String nickname = session.getAttribute("nickname").toString();
		return studyGroupService.addStudyGroupMember(userId, nickname, studyGroup);
	}
	
	//스터디 참여 가능한 사용자인지 체크
	@GetMapping("/studygroup/check/{groupId}")
	public int checkAlreadyJoin(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		return studyGroupService.checkAlreadyJoin(userId, groupId);
	}
	
	//가입 상태 체크(멤버/비멤버)
	@GetMapping("/studygroup/check/member/{groupId}")
	public ResponseEntity<Map<String,String>> checkGroupMember(HttpSession session, @PathVariable(name="groupId")int groupId) {

		String userId = session.getAttribute("user_id").toString();

		Map<String, String> map = new HashMap<>();
		if(studyGroupService.checkRegMember(groupId, userId)==1) {						
			map.put("result", "member");			
		}
		else if(studyGroupService.checkRegMember(groupId, userId)==0){
			map.put("result", "not member");
		}
		
		ResponseEntity<Map<String,String>> responseEntity = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		
		return responseEntity;
	}
	
	//인원 초과 여부 체크
	@GetMapping("/studygroup/check/count/{groupId}")
	public ResponseEntity<Map<String,String>> isOverMaxMember(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		
		Map<String, String> map = new HashMap<>();
		if(studyGroupService.isOverMaxMember(groupId)==1) {						
			map.put("result", "not over");			
		}
		else if(studyGroupService.isOverMaxMember(groupId)==0){
			map.put("result", "over");
		}
		
		ResponseEntity<Map<String,String>> responseEntity = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		
		return responseEntity;
	}
	
	//개설자 여부 체크
	@GetMapping("/studygroup/check/state/{groupId}")
	public ResponseEntity<Map<String,String>> isGroupLeader(HttpSession session, @PathVariable(name="groupId")int groupId) {
		String userId = session.getAttribute("user_id").toString();
		
		Map<String, String> map = new HashMap<>();
		if(studyGroupService.isGroupLeader(userId, groupId)==1) {						
			map.put("result", "leader");			
		}
		else if(studyGroupService.isGroupLeader(userId, groupId)==0){
			map.put("result", "member");
		}
		
		ResponseEntity<Map<String,String>> responseEntity = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		
		return responseEntity;
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
		return studyGroupService.isGroupLeader(userId, groupId);
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
	
	
	
	@GetMapping("/college")
	public List<College> getAllCollege(){
		return studyGroupService.getAllCollege();
	}
	
	@GetMapping("/college/{keyword}")
	public List<College> searchCollege(@PathVariable(name="keyword") String keyword){
		return studyGroupService.searchCollege(keyword);
	}
	
	
}
