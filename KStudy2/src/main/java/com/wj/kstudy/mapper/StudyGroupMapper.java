package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.User;

@Mapper
public interface StudyGroupMapper {
	public List<StudyGroup> getStudyGroup(String lecId);
	public List<StudyGroup> getStudyGroupPaging(@Param("lecId") String lecId, @Param("start") int start, @Param("recordsPerPage") int recordsPerPage);
	public int addStudyGroup(StudyGroup studyGroup);
	public int addCurMember(int groupId);
	public int minusCurMember(int groupId);
	public StudyGroup getOneStudyGroup(int groupId);
	public int updateStudyGroup(StudyGroup studyGroup);
	public int deleteStudyGroup(int groupId);
	public int updateUseYn(int groupId);
	public int plusPostCnt(int groupId);
	public int minusPostCnt(int groupId);
	public int countStudyGroup(String lecId);
}
