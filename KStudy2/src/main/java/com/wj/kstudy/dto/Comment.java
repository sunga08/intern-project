package com.wj.kstudy.dto;

import java.util.Date;

public class Comment {
	int commentId;
	int boardId;
	int groupId;
	int depth;
	int bundleId;
	int bundleOrder;
	String content;
	String regUser;
	Date regDtm;
	Date modDtm;
	String useYn;
	
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegUser() {
		return regUser;
	}
	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}
	public Date getRegDtm() {
		return regDtm;
	}
	public void setRegDtm(Date regDtm) {
		this.regDtm = regDtm;
	}	
	
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getBundleId() {
		return bundleId;
	}
	public void setBundleId(int bundleId) {
		this.bundleId = bundleId;
	}
	public int getBundleOrder() {
		return bundleOrder;
	}
	public void setBundleOrder(int bundleOrder) {
		this.bundleOrder = bundleOrder;
	}
	
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}	
	
	public Date getModDtm() {
		return modDtm;
	}
	public void setModDtm(Date modDtm) {
		this.modDtm = modDtm;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", boardId=" + boardId + ", groupId=" + groupId + ", content="
				+ content + ", regUser=" + regUser + ", regDtm=" + regDtm + "]";
	}
	
	
}
