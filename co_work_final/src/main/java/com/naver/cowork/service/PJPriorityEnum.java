package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum PJPriorityEnum {
	LOWPRIORITY("낮음"),
	NONEPRIORITY("없음"),
	HIGHPRIORITY("높음"),
	NEEDCONFIRM("요청 확인");
	@Getter
	@Setter
	private String priority;

	private PJPriorityEnum(String priority) {
		this.priority = priority;
	}
	

}
