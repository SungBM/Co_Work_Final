package com.naver.cowork.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	private String ID;
	private String SENDER;
	private String MESSAGE;
	private Date SEND_DATE;
	
}
