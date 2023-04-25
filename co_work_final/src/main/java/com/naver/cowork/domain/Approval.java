package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Approval {
	
	
	private int APPROVAL_NUM;
	private String DOCUMENT_FORM_CODE;
	private String APPROVAL_USER_ID;
	private String APPROVAL_DATE;
	private int APPROVAL_STATE;
	private String APPROVAL_OPINION;
	private int APPROVAL_LEVEL;
	private String DOCUMENT_APPROVAL_DATE;
	
	private String USER_CARD;
	private String USER_NAME;
    private String USER_DEPT;
    private String USER_JOB;	
    private String DEPT_NAME;
    private String JOB_NAME;
	
	
	public String getAPPROVAL_DATE() {
		return APPROVAL_DATE;
	}
	
	public void setAPPROVAL_DATE(String aPPROVAL_DATE) {
		APPROVAL_DATE = aPPROVAL_DATE.substring(0,10);
	}
}