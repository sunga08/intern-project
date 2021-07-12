package com.wj.kstudy.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


public class StudyGroup {

	int groupId;
	String lecId;
	String lecName;
	String groupName;
	String schoolName;
	String shortDsc;
	String longDsc;
	int curMem;
	int maxMem;
	//Date regDtm;
	Date createDate;
	String regUser;
	int postCnt;
	

	public int getGroupId() {
		return groupId;
	}


	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}


	public String getLecId() {
		return lecId;
	}

	public String getLecName() {
		return lecName;
	}
	
	
	public void setLecName(String lecName) {
		this.lecName = lecName;
	}

	public void setLecId(String lecId) {
		this.lecId = lecId;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}


	public String getShortDsc() {
		return shortDsc;
	}


	public void setShortDsc(String shortDsc) {
		this.shortDsc = shortDsc;
	}


	public String getLongDsc() {
		return longDsc;
	}


	public void setLongDsc(String longDsc) {
		this.longDsc = longDsc;
	}


	public int getCurMem() {
		return curMem;
	}


	public void setCurMem(int curMem) {
		this.curMem = curMem;
	}


	public int getMaxMem() {
		return maxMem;
	}


	public void setMaxMem(int maxMem) {
		this.maxMem = maxMem;
	}


//	public Date getRegDtm() {
//		return regDtm;
//	}
//
//
//	public void setRegDtm(Date regDtm) {
//		this.regDtm = regDtm;
//	}


	
	
	public String getRegUser() {
		return regUser;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}	


	public int getPostCnt() {
		return postCnt;
	}


	public void setPostCnt(int postCnt) {
		this.postCnt = postCnt;
	}


	@Override
	public String toString() {
		return "StudyGroup [groupId=" + groupId + ", lecId=" + lecId + ",lecName=" + lecName + ", schoolName=" + schoolName + ", shortDsc="
				+ shortDsc + ", longDsc=" + longDsc + ", curMem=" + curMem + ", maxMem=" + maxMem + ", createDate="
				+ createDate + "]";
	}
	
	
}
