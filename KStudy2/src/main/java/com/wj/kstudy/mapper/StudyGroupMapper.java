package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.User;

@Mapper
public interface StudyGroupMapper {
	public List<StudyGroup> showStudyGroup(String lecId);
	public int addStudyGroup(StudyGroup studyGroup);
	public int addCurMember(int groupId);
	public int minusCurMember(int groupId);
	public StudyGroup getOneStudyGroup(int groupId);
	public int updateStudyGroup(StudyGroup studyGroup);
	public int deleteStudyGroup(int groupId);
	public int updateUseYn(int groupId);
}
