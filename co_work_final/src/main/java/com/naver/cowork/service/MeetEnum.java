package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum MeetEnum {
	SUCCESS(1), FAIL(0);

	@Getter
	@Setter
	private int value;

	private MeetEnum(int value) {
		this.value = value;
	}

	public static void main(String args[]) {

		int v = MeetEnum.SUCCESS.value;
		
		System.out.println(v);
	}
}