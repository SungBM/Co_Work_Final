package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Row {
    private int startRow;
    private int endRow;

    public Row(int startrow, int endrow) {
        this.startRow=startrow;
        this.endRow=endrow;
    }
}
