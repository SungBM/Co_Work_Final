package com.naver.cowork.domain;

//전자결재 관련 domain
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EDMS {
	private String DOCUMENT_FORM_CODE;
    private String DOCUMENT_TITLE;
    private int DOCUMENT_CATEGORY_NUM;
    private String USER_ID;
    private String APPROVAL_TURN_CODE;
    private String DOCUMENT_FORM_DATE;
    private int DOCUMENT_FORM_SECURITY;
    private int DOCUMENT_STATE;
    private String USER_NAME;
    private String JOB_NAME;
    private String DEPT_NAME;
    private String STATE_RESULT;
    private String APPROVAL_DATE;
    private String APPROVAL_DATE_RESULT;
    private String CATEGORY_RESULT;
    private int APPROVAL_STATE;
    private String APPROVAL_STATE_RESULT;
	private int APPROVAL_NUM;
	private String USER_CARD;
    private String USER_JOB;	
    private String USER_DEPT;
	private String APPROVAL_USER_ID;
	private String APPROVAL_OPINION;
	private int APPROVAL_LEVEL;
	private String DOCUMENT_APPROVAL_DATE;
}
