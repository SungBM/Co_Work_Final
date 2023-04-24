package com.naver.cowork.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
	//notice_write.jsp에서 name속성 확인.
	//<input type="file" id="upfile" name="uploadfile"> 확인
	private MultipartFile uploadfile;
	
	private String NOTICE_ORIGINAL;	//첨부될 파일의 이름           
	private String NOTICE_REG_DATE;
	
	public String getNOTICE_REG_DATE() {
		return NOTICE_REG_DATE;
	}

	public void setNOTICE_REG_DATE(String nOTICE_REG_DATE) {
		NOTICE_REG_DATE =  nOTICE_REG_DATE.substring(0,10);
	}
	
}
	
	