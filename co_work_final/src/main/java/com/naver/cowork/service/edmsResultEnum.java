package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum edmsResultEnum {
    WAIT(0,"대기중"), COMPLETE(1,"승인됨"), REJECT(-1,"반려됨");

    @Getter
    @Setter
    private int value;
    
    @Getter
    @Setter
    private String resultString;

    private edmsResultEnum(int value,String resultString) {
        this.value = value;
        this.resultString = resultString;
    }
}