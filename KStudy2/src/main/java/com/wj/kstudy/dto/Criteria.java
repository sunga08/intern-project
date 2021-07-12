package com.wj.kstudy.dto;

import java.util.List;

public class Criteria {
	/** 현재 페이지 번호 */
	private int currentPageNo;

	/** 페이지당 출력할 데이터 개수 */
	private int recordsPerPage;

	/** 화면 하단에 출력할 페이지 사이즈 */
	private int pageSize;
	
	private int totalData;
	
	
	public Criteria() {
		this.currentPageNo = 1;
		this.recordsPerPage = 3;
		this.pageSize = 5;
	}

	public int getStartPage() {
		return (currentPageNo - 1) * recordsPerPage;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
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



	
	
	
}
