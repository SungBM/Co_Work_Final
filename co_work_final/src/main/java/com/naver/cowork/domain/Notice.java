package com.naver.cowork.domain;

public class Notice {
	private int NOTICE_NUM;                             
	private String USER_ID;                                           
	private String NOTICE_SUBJECT;                            
	private String NOTICE_CONTENT;                            
	private String NOTICE_FILE;                                     
	private int NOTICE_RE_REF;                                     
	private int NOTICE_RE_LEV;                                     
	private int NOTICE_RE_SEQ;                                      
	private int NOTICE_READCOUNT;                                   
	private String NOTICE_REG_DATE;
	
	
	public int getNOTICE_NUM() {
		return NOTICE_NUM;
	}
	public void setNOTICE_NUM(int nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getNOTICE_SUBJECT() {
		return NOTICE_SUBJECT;
	}
	public void setNOTICE_SUBJECT(String nOTICE_SUBJECT) {
		NOTICE_SUBJECT = nOTICE_SUBJECT;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_FILE() {
		return NOTICE_FILE;
	}
	public void setNOTICE_FILE(String nOTICE_FILE) {
		NOTICE_FILE = nOTICE_FILE;
	}
	public int getNOTICE_RE_REF() {
		return NOTICE_RE_REF;
	}
	public void setNOTICE_RE_REF(int nOTICE_RE_REF) {
		NOTICE_RE_REF = nOTICE_RE_REF;
	}
	public int getNOTICE_RE_LEV() {
		return NOTICE_RE_LEV;
	}
	public void setNOTICE_RE_LEV(int nOTICE_RE_LEV) {
		NOTICE_RE_LEV = nOTICE_RE_LEV;
	}
	public int getNOTICE_RE_SEQ() {
		return NOTICE_RE_SEQ;
	}
	public void setNOTICE_RE_SEQ(int nOTICE_RE_SEQ) {
		NOTICE_RE_SEQ = nOTICE_RE_SEQ;
	}
	public int getNOTICE_READCOUNT() {
		return NOTICE_READCOUNT;
	}
	public void setNOTICE_READCOUNT(int nOTICE_READCOUNT) {
		NOTICE_READCOUNT = nOTICE_READCOUNT;
	}
	public String getNOTICE_REG_DATE() {
		return NOTICE_REG_DATE;
	}
	public void setNOTICE_REG_DATE(String nOTICE_REG_DATE) {
		NOTICE_REG_DATE = nOTICE_REG_DATE;
	}         
	
	
}
