package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

public enum edmsCategoryEnum {
    BSTRIP(1);

    @Getter
    @Setter
    private int value;

    private edmsCategoryEnum(int value) {
        this.value = value;
    }
}