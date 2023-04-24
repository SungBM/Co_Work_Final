package com.naver.cowork.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Approval_Opinion {
	private int APPROVAL_NUM;
	private int DOCUMENT_CODE;
	private String USER_ID;
	private String APPROVAL_OPINION;
	private Date APPROVAL_OPINION_DATE;

}
