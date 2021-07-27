package com.wj.kstudy.service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wj.kstudy.dto.College;
import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.dto.GroupRegInfo;
import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.User;
import com.wj.kstudy.mapper.CollegeMapper;
import com.wj.kstudy.mapper.GroupRegInfoMapper;
import com.wj.kstudy.mapper.StudyGroupMapper;
import com.wj.kstudy.mapper.UserMapper;

@Service
public class StudyGroupService {
	@Autowired
	StudyGroupMapper studyGroupMapper;
	
	@Autowired
	GroupRegInfoMapper groupRegInfoMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	CollegeMapper collegeMapper;

	@Value("6")
	private int PAGE_SIZE;
	
	public List<StudyGroup> getMyStudyGroup(String regUser, Criteria criteria){
		int totalCount = studyGroupMapper.countMyStudyGroup(regUser);
		criteria.setRecordsPerPage(6);
		criteria.setTotalData(totalCount);
		
		List<StudyGroup> groupList = Collections.emptyList();
		int start = criteria.getStartPage(); //offset
		
		if(totalCount>0) {
			groupList = studyGroupMapper.myStudyGroup(regUser, start, PAGE_SIZE);
		}
				
		return groupList;
	}
	
	public List<StudyGroup> showStudyGroup(String lecId) {
		return studyGroupMapper.getStudyGroup(lecId);
	}

	public List<StudyGroup> getStudyGroupPaging(String lecId, Criteria criteria) {
		int totalCount = studyGroupMapper.countStudyGroup(lecId);
		criteria.setRecordsPerPage(6);
		criteria.setTotalData(totalCount);
		
		List<StudyGroup> groupList = Collections.emptyList();
		int start = criteria.getStartPage(); //offset
		
		if(totalCount>0) {
			groupList = studyGroupMapper.getStudyGroupPaging(lecId, start, PAGE_SIZE);
		}
				
		return groupList;
	}
	
	//스터디 생성
	@Transactional
	public int addStudyGroup(StudyGroup studyGroup, HttpSession session) {
		GroupRegInfo groupRegInfo = new GroupRegInfo();
		
		int result = 0;
		
		try {	
			int addResult = studyGroupMapper.addStudyGroup(studyGroup);
			groupRegInfo.setUserId(session.getAttribute("user_id").toString());
			groupRegInfo.setGroupId(studyGroup.getGroupId());
			groupRegInfo.setRegDtm(studyGroup.getCreateDate());
			groupRegInfo.setRegUser(studyGroup.getRegUser());
			if(addResult==1 && groupRegInfoMapper.addGroupRegInfo(groupRegInfo)==1) {
				result = studyGroupMapper.addCurMember(studyGroup.getGroupId());
			}
			else {
				result = 0;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}		
		
		return result;

	}
	
//	public int countMember(int groupId) {
//		return groupRegInfoMapper.countMember(groupId);
//	}
	
	//스터디 참여
	@Transactional
	public int addStudyGroupMember(String userId, String nickname, StudyGroup studyGroup) {
		int result = 0;
		GroupRegInfo groupRegInfo = new GroupRegInfo();
		
		try {
			if(groupRegInfoMapper.countUserId(studyGroup.getGroupId(), userId)==0) {
				groupRegInfo.setUserId(userId);
				groupRegInfo.setRegUser(nickname);
				groupRegInfo.setGroupId(studyGroup.getGroupId());
				System.out.println(groupRegInfo.toString());
				if(groupRegInfoMapper.addGroupRegInfo(groupRegInfo)==1) {				
					result = studyGroupMapper.addCurMember(studyGroup.getGroupId());
				}
				else {
					result = 0;
				}
			}
			else {
				result=0;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	//스터디 그룹 정보 조회
	public StudyGroup getOneStudyGroup(int groupId) {
		return studyGroupMapper.getOneStudyGroup(groupId);
	}
	
	//스터디 참여 가능 여부 체크
	public int checkAlreadyJoin(String userId, int groupId) {
		
		if(groupRegInfoMapper.countUserId(groupId, userId)>0) { //그룹에 사용자ID가 있는지 체크
			return 0;
		}
		else if(studyGroupMapper.getOneStudyGroup(groupId).getCurMem()>=studyGroupMapper.getOneStudyGroup(groupId).getMaxMem()) {
			return -1;
		}
		else {
			return 1;
		}
		
	}
	
	//스터디 인원초과 여부 체크
	public int isOverMaxMember(int groupId) {
		if(studyGroupMapper.getOneStudyGroup(groupId).getCurMem()<studyGroupMapper.getOneStudyGroup(groupId).getMaxMem()) {
			return 1; //인원초과X
		}
		else {
			return 0; //인원초과
		}
	}
	
	//스터디 정보 수정
	public int updateStudyGroup(StudyGroup studyGroup) {
		return studyGroupMapper.updateStudyGroup(studyGroup);
	}
	
	//개설자 여부 체크
	public int isGroupLeader(String userId, int groupId) {
		StudyGroup studyGroup = studyGroupMapper.getOneStudyGroup(groupId);

		if(studyGroup.getRegUser().equals(userId)) {
			return 1; //개설자
		}
//		else if(groupRegInfoMapper.countUserId(groupId, userId)==0) {
//			return -1; //가입된 사용자가 아님
//		}
		else {
			return 0; //
		}
	}
	
	//스터디 멤버 조회
	public List<User> getStudyMembers(int groupId){
		return userMapper.getStudyMembers(groupId);
	}
	
	//스터디 탈퇴
	public int deleteMember(int groupId, String userId) {
		int result=0;
		GroupRegInfo groupRegInfo = groupRegInfoMapper.getGroupRegInfo(groupId, userId);
		if(groupRegInfoMapper.deleteGroupRegInfo(groupRegInfo)==1) {
			result=studyGroupMapper.minusCurMember(groupId);
		}
		else {
			result=0;
		}
		
		return result;
		
	}
	
	// 스터디 삭제
//	public int deleteStudyGroup(int groupId) {
//		int result=0;
//		
//		try {
//			groupRegInfoMapper.deleteAllGroupRegInfo(groupId);
//			result=studyGroupMapper.deleteStudyGroup(groupId);
//		} catch(Exception e) {
//			e.printStackTrace();
//			result = 0;
//		}
//		
//		return result;
//	}
	
	public int deleteStudyGroup(int groupId) {
		int result=0;
		
		try {
			result=studyGroupMapper.updateUseYn(groupId);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	//스터디 멤버인지 체크
	public int checkRegMember(int groupId, String userId) {
		if(groupRegInfoMapper.countUserId(groupId, userId)==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	public List<College> getAllCollege(){
		return collegeMapper.getAllCollege();
	}
	
	//검색한 학교 조회
	public List<College> searchCollege(String keyword){
		return collegeMapper.searchCollege(keyword);
	}
	
	public int countStudyGroup(String lecId) {
		return studyGroupMapper.countStudyGroup(lecId);
	}
	
	public int countMyStudyGroup(String userId) {
		return studyGroupMapper.countMyStudyGroup(userId);
	}

}
