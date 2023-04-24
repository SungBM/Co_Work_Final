package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum AdminEnum {
	DUPLICATION(1), SUCCESS(0);

	@Getter
	@Setter
	private int value;

	private AdminEnum(int value) {
		this.value = value;
	}

	public static void main(String args[]) {

		int v = AdminEnum.SUCCESS.value;
		
		System.out.println(v);
	}
}
