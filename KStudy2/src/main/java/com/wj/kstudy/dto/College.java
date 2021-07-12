package com.wj.kstudy.dto;

public class College {
	int collegeSeq;
	String collegeGbn;
	String collegeSido;
	String collegeName;
	
	public int getCollegeSeq() {
		return collegeSeq;
	}
	public void setCollegeSeq(int collegeSeq) {
		this.collegeSeq = collegeSeq;
	}

	public String getCollegeGbn() {
		return collegeGbn;
	}
	public void setCollegeGbn(String collegeGbn) {
		this.collegeGbn = collegeGbn;
	}
	public String getCollegeSido() {
		return collegeSido;
	}
	public void setCollegeSido(String collegeSido) {
		this.collegeSido = collegeSido;
	}

	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	
	@Override
	public String toString() {
		return "University [collegeSeq=" + collegeSeq  + ", collegeGbn=" + collegeGbn
				+ ", collegeSido=" + collegeSido + ", collegeName=" + collegeName
				+ "]";
	}
	
	
}
