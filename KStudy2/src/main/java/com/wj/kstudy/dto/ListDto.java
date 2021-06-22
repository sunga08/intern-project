package com.wj.kstudy.dto;

import lombok.Data;

@Data
public class ListDto {
	String ServiceKey;
	int Page;
	public String getServiceKey() {
		return ServiceKey;
	}
	public void setServiceKey(String serviceKey) {
		ServiceKey = serviceKey;
	}
	public int getPage() {
		return Page;
	}
	public void setPage(int page) {
		Page = page;
	}
	@Override
	public String toString() {
		return "ListDto [ServiceKey=" + ServiceKey + ", Page=" + Page + "]";
	}
	
}
