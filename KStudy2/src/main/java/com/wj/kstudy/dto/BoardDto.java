package com.wj.kstudy.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardDto {
	private int num;
	private String title;
	private String content;
	private String writer;	
}
