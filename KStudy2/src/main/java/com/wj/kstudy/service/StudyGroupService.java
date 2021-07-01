package com.wj.kstudy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wj.kstudy.dto.GroupRegInfo;
import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.mapper.GroupRegInfoMapper;
import com.wj.kstudy.mapper.StudyGroupMapper;

@Service
public class StudyGroupService {
	@Autowired
	StudyGroupMapper studyGroupMapper;
	
	@Autowired
	GroupRegInfoMapper groupRegInfoMapper;
	
	public List<StudyGroup> showStudyGroup(String lecId) {
		return studyGroupMapper.showStudyGroup(lecId);
	}
	
	@Transactional
	public int addStudyGroup(StudyGroup studyGroup) {
		GroupRegInfo groupRegInfo = new GroupRegInfo();
		
		int result = 0;
		
		try {	
			studyGroupMapper.addStudyGroup(studyGroup);
			groupRegInfo.setUserId(studyGroup.getRegUser());
			groupRegInfo.setGroupId(studyGroup.getGroupId());
			groupRegInfo.setRegDtm(studyGroup.getCreateDate());
			if(groupRegInfoMapper.addGroupRegInfo(groupRegInfo)==1) {				
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
	
	
	public StudyGroup getOneStudyGroup(int groupId) {
		return studyGroupMapper.getOneStudyGroup(groupId);
	}
	
	
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

}
