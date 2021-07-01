package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.StudyGroup;

@Mapper
public interface StudyGroupMapper {
	public List<StudyGroup> showStudyGroup(String lecId);
	public int addStudyGroup(StudyGroup studyGroup);
	public int addCurMember(int groupId);
	public StudyGroup getOneStudyGroup(int groupId);
}
