package com.wj.kstudy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wj.kstudy.dto.GroupRegInfo;
import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.User;
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
	
	public List<StudyGroup> showStudyGroup(String lecId) {
		return studyGroupMapper.showStudyGroup(lecId);
	}
	
	//스터디 생성
	@Transactional
	public int addStudyGroup(StudyGroup studyGroup) {
		GroupRegInfo groupRegInfo = new GroupRegInfo();
		
		int result = 0;
		
		try {	
			int addResult = studyGroupMapper.addStudyGroup(studyGroup);
			groupRegInfo.setUserId(studyGroup.getRegUser());
			groupRegInfo.setGroupId(studyGroup.getGroupId());
			groupRegInfo.setRegDtm(studyGroup.getCreateDate());
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
	public int addStudyGroupMember(String userId, StudyGroup studyGroup) {
		int result = 0;
		GroupRegInfo groupRegInfo = new GroupRegInfo();
		
		try {
			if(groupRegInfoMapper.countUserId(studyGroup.getGroupId(), userId)==0) {
				groupRegInfo.setUserId(userId);
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
		
		if(groupRegInfoMapper.countUserId(groupId, userId)>0) {
			return 0;
		}
		else if(studyGroupMapper.getOneStudyGroup(groupId).getCurMem()>=studyGroupMapper.getOneStudyGroup(groupId).getMaxMem()) {
			return -1;
		}
		else {
			return 1;
		}
		

	}
	
	//스터디 정보 수정
	public int updateStudyGroup(StudyGroup studyGroup) {
		return studyGroupMapper.updateStudyGroup(studyGroup);
	}
	
	//스터디 정보 수정시 사용자 체크
	public int updateMemberCheck(String user, int groupId) {
		StudyGroup studyGroup = studyGroupMapper.getOneStudyGroup(groupId);

		if(studyGroup.getRegUser().equals(user)) {
			return 1;
		}
		else {
			return 0;
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
	public int deleteStudyGroup(int groupId) {
		int result=0;
		
		try {
			groupRegInfoMapper.deleteAllGroupRegInfo(groupId);
			result=studyGroupMapper.deleteStudyGroup(groupId);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	
	public int checkRegMember(int groupId, String userId) {
		if(groupRegInfoMapper.countUserId(groupId, userId)==1) {
			return 1;
		}else {
			return 0;
		}
	}

}
