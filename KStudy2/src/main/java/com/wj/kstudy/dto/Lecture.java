package com.wj.kstudy.dto;

import java.util.Date;

public class Lecture {
	String lecId;
	String blocksUrl;
	String lecUrl;
	String lecName;
	String classfy;
	String midClassfy;
	String teachers;
	String orgName;
	String enrollStart;
	String enrollEnd;
	String auditYn;
	String image;
	String shortDsc;
	String hidden;
	String languageName;
	
	public String getLecId() {
		return lecId;
	}
	public void setLecId(String lecId) {
		this.lecId = lecId;
	}
	public String getBlocksUrl() {
		return blocksUrl;
	}
	public void setBlocksUrl(String blocksUrl) {
		this.blocksUrl = blocksUrl;
	}
	public String getLecUrl() {
		return lecUrl;
	}
	public void setLecUrl(String lecUrl) {
		this.lecUrl = lecUrl;
	}
	public String getLecName() {
		return lecName;
	}
	public void setLecName(String lecName) {
		this.lecName = lecName;
	}
	public String getClassfy() {
		return classfy;
	}
	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}
	public String getMidClassfy() {
		return midClassfy;
	}
	public void setMidClassfy(String midClassfy) {
		this.midClassfy = midClassfy;
	}
	public String getTeachers() {
		return teachers;
	}
	public void setTeachers(String teachers) {
		this.teachers = teachers;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getEnrollStart() {
		return enrollStart;
	}
	public void setEnrollStart(String enrollStart) {
		this.enrollStart = enrollStart;
	}
	public String getEnrollEnd() {
		return enrollEnd;
	}
	public void setEnrollEnd(String enrollEnd) {
		this.enrollEnd = enrollEnd;
	}
	public String getAuditYn() {
		return auditYn;
	}
	public void setAuditYn(String auditYn) {
		this.auditYn = auditYn;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getShortDsc() {
		return shortDsc;
	}
	public void setShortDsc(String shortDsc) {
		this.shortDsc = shortDsc;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
	
	@Override
	public String toString() {
		return "Lecture [lecId=" + lecId + ", blocksUrl=" + blocksUrl + ", lecUrl=" + lecUrl + ", lecName=" + lecName
				+ ", classfy=" + classfy + ", midClassfy=" + midClassfy + ", teachers=" + teachers + ", orgName="
				+ orgName + ", enrollStart=" + enrollStart + ", enrollEnd=" + enrollEnd + ", auditYn=" + auditYn
				+ ", image=" + image + ", shortDsc=" + shortDsc + ", hidden=" + hidden + ", languageName=" + languageName + "]";
	}
}
