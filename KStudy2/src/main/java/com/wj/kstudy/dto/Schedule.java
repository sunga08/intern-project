package com.wj.kstudy.dto;

public class Schedule {
	int scheduleId;
	int groupId;
	String startDate;
	String endDate;
	String startTime;
	String endTime;
	String planTitle;
	String planContent;
	String allDay;
	String regUser;
	
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void seStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getPlanTitle() {
		return planTitle;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	public String getPlanContent() {
		return planContent;
	}
	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}
	
	
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public String getRegUser() {
		return regUser;
	}
	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}
	
	@Override
	public String toString() {
		return "Schedule [scheduleId=" + scheduleId + ", groupId=" + groupId + ", startDate=" + startDate + ", endDate="
				+ endDate + ", planTime=" + startTime + ", planTitle=" + planTitle + ", planContent=" + planContent
				+ ", regUser=" + regUser + "]";
	}
	
	
}
