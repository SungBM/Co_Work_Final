package com.naver.cowork.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	private int roomNumber;
	private String CHAT_DATE;
	private String CHAT_SENDER;
	private String CHAT_CONTENT;
	private String dept_name;
	
//	private String ID;
//	private String MESSAGE;
	
}
