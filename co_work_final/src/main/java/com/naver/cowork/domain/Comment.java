package com.naver.cowork.domain;

import lombok.Data;

@Data
public class Comment {
	private int NUM;
	private String ID;
	private String CONTENT;
	private String REG_DATE;
	private int FREEBOARD_NUM;
	
	public void setREG_DATE(String REG_DATE) {
		this.REG_DATE = REG_DATE.substring(0,10);
	}
}
	
	
