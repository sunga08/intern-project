package com.wj.kstudy.dto;

import java.util.List;

public class Criteria {
	/** 현재 페이지 번호 */
	private int currentPageNo;

	/** 페이지당 출력할 데이터 개수 (amount) */
	private int recordsPerPage;

	/** 화면 하단에 출력할 페이지 사이즈 */
	private int pageSize;
	
	private int totalData;
	
	private int skip;
	
	private int groupId;
	
	private String keyword;
	
	public Criteria() {
		this.currentPageNo = 1;
		this.recordsPerPage = 5;
		this.pageSize = 5;
		this.skip=0;
	}

	public Criteria(int currentPageNo, int recordsPerPage) {
		this.currentPageNo = currentPageNo;
		this.recordsPerPage = recordsPerPage;
		this.skip = (currentPageNo-1)*recordsPerPage;
	}
	
	public int getStartPage() {
		return (currentPageNo - 1) * recordsPerPage;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.skip =(currentPageNo-1)*this.recordsPerPage; //
		this.currentPageNo = currentPageNo;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.skip = (this.currentPageNo-1)*recordsPerPage; //
		this.recordsPerPage = recordsPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public int getGroupId() {
		return groupId;
	}
	
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
