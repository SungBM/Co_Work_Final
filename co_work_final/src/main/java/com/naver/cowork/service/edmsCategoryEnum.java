package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum edmsCategoryEnum {
    BSTRIP(1,"출장신청서"),
	VACATION (2,"휴가신청서"),
	DAYOFF (3,"연차신청서"),
	PAYORDER (4,"지출결의서"),
	OVERTIME (5,"연장근무 신청서");

    @Getter
    @Setter
    private int value;
    
    @Getter
    @Setter
    private String docName;

    private edmsCategoryEnum(int value,String docName) {
        this.value = value;
        this.docName = docName;
    }
}