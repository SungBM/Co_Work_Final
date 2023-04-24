package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApprovalLine {
	int APPROVAL_NUM;
	String DOCUMENT_FORM_CODE;
	String APPROVAL_USER_ID;
	String APPROVAL_DATE;
	int APPROVAL_STATE;
	String APPROVAL_OPINION;
	int APPROVAL_LEVEL;
	String DOCUMENT_APPROVAL_DATE;
}
