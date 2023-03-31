package com.naver.cowork.domain;

import java.util.Date;

public class ChatVO {
	private String ID;
	private String SENDER;
	private String MESSAGE;
	private Date SEND_DATE;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSENDER() {
		return SENDER;
	}
	public void setSENDER(String sENDER) {
		SENDER = sENDER;
	}
	public String getMESSAGE() {
		return MESSAGE;
	}
	public void setMESSAGE(String mESSAGE) {
		MESSAGE = mESSAGE;
	}
	public Date getSEND_DATE() {
		return SEND_DATE;
	}
	public void setSEND_DATE(Date sEND_DATE) {
		SEND_DATE = sEND_DATE;
	}
	
	
}
