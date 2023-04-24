package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum edmsResultEnum {
    WAIT(0), ING(1), REJECT(2), COMPLETE(3);

    @Getter
    @Setter
    private int value;

    private edmsResultEnum(int value) {
        this.value = value;
    }
}