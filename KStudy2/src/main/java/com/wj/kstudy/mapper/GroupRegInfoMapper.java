package com.wj.kstudy.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wj.kstudy.dto.GroupRegInfo;

@Mapper
public interface GroupRegInfoMapper {
	public int addGroupRegInfo(GroupRegInfo groupRegInfo);
	public int countMember(int groupId);
	public int countUserId(@Param("groupId") int groupId, @Param("userId")String userId);
}
