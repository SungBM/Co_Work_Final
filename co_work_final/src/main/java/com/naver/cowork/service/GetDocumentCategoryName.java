package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum GetDocumentCategoryName {
	BSTRIP("1");
		
	@Getter
	@Setter
	private String num;

	private GetDocumentCategoryName(String num) {
		this.num = num;
	}
	

}
