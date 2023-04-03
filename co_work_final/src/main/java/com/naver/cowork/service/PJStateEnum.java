package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum PJStateEnum {
	OVERDEADLINE("마감"),
	NIGHDEADLINE("마감 임박"),
	PROCEEDING("진행중"),
	NEEDCONFIRM("요청 확인");
		
	@Getter
	@Setter
	private String state;

	private PJStateEnum(String state) {
		this.state = state;
	}
	

}
