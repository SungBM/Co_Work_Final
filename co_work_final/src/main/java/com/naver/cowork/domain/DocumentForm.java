package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentForm {
	String DOCUMENT_FORM_CODE;
	String DOCUMENT_TITLE;
	int DOCUMENT_CATEGORY_NUM;
	String USER_ID;
	String DOCUMENT_FORM_DATE;
	String DOCUMENT_STATE;
	String APPROVAL_NOW_LEVEL;
}
