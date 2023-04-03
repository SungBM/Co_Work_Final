package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Calendar {
    private int cal_no;
    private String cal_type;
    private String cal_title;
    private String cal_content;
    private String cal_regi_date;
    private String cal_start_date;
    private String cal_end_date;
    private String cal_allday;
    private String cal_status;
    private String cal_color;
    private String user_id;
    
    // 종일 이벤트 아닐시 시간 값
    private String cal_start_time;
    private String cal_end_time;

}