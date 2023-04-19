package com.naver.cowork.service;

public class PageUtil {
    public static PageBlock getPageBlock(int listcount, int page,int limit){
        int maxpage = (listcount + limit -1) / limit;

        // 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
        int startpage = ((page -1) / 10) * 10 + 1;

        //현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
        int endpage = startpage + 10 -1;

        if (endpage > maxpage)
            endpage = maxpage;

        return new PageBlock(maxpage,startpage,endpage);
    }

    public static Row getRow(int page, int limit){
        int startrow=(page-1)*limit+1;
        int endrow=startrow+limit-1;

        return new Row(startrow,endrow);
    }

}
