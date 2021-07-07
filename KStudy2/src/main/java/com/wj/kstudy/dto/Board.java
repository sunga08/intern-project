package com.wj.kstudy.dto;

import java.sql.Date;

public class Board {
	int boardId;
	int groupId;
	String userId;
	String title;
	String content;
	int viewCnt;
	Date regDtm;
	
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public Date getRegDtm() {
		return regDtm;
	}
	public void setRegDtm(Date regDtm) {
		this.regDtm = regDtm;
	}
	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", groupId=" + groupId + ", userId=" + userId + ", title=" + title
				+ ", content=" + content + ", viewCnt=" + viewCnt + "]";
	}
	
	
}
