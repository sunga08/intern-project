package com.wj.kstudy.dto;

import java.util.Date;

public class GroupRegInfo {
	int infoId;
	int groupId;
	String userId;
	Date regDtm;
	String regUser;
	
	

	public String getRegUser() {
		return regUser;
	}
	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}
	public int getInfoId() {
		return infoId;
	}
	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegDtm() {
		return regDtm;
	}
	public void setRegDtm(Date regDtm) {
		this.regDtm = regDtm;
	}
	
	@Override
	public String toString() {
		return "GroupRegInfo [infoId=" + infoId + ", groupId=" + groupId + ", userId=" + userId + ", regDtm=" + regDtm
				+ "]";
	}
	
	
}
