package com.naver.cowork.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FreeBoard {
	private int FREEBOARD_NUM;
	private String USER_ID;
	private String FREEBOARD_NAME;
	private String FREEBOARD_PASS;
	private String FREEBOARD_SUBJECT;
	private String FREEBOARD_CONTENT;
	private String FREEBOARD_FILE;
	private String FREEBOARD_ORIGINAL;
	private int FREEBOARD_RE_REF;
	private int FREEBOARD_RE_LEV;
	private int FREEBOARD_RE_SEQ;
	private int FREEBOARD_READCOUNT;
	private String FREEBOARD_DATE;
	private MultipartFile uploadfile;
	private int cnt;
	private String FREEBOARD_REG_DATE;
	
	public void setFREEBOARD_DATE(String FREEBOARD_DATE) {
		this.FREEBOARD_DATE = FREEBOARD_DATE.substring(0,10);
	}
	
}
