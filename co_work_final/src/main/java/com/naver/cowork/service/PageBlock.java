package com.naver.cowork.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBlock {
    private int maxpage;
    private int startpage;
    private int endpage;

    public PageBlock(int maxpage, int startpage, int endpage) {
        this.maxpage=maxpage;
        this.startpage=startpage;
        this.endpage=endpage;
    }
}
