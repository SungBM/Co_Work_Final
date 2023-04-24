package com.naver.cowork.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Ocument_Form {
	private int DOCUMENT_FORM_CODE;
	private int DOCUMENT_FORM_CATEGORY_TITLE;
	private String DOCUMENT_FORM_NAME;
	private String USER_ID;
	private String APPROVAL_TURN_CODE;
	private Date DOCUMENT_FORM_DATE;
	private int DOCUMENT_FORM_SECURITY;
	private int DOCUMENT_FORM_STATE;
}
