package com.naver.cowork.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss.SSS";
  
    
    public static int getDayCount(String startDate, String endDate) {
		int prog = 0;
		
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        try {
        	Date startFormat =  sdf.parse(startDate);
    	    Date endFormat =  sdf.parse(endDate);
    	    Date todayformat = sdf.parse(strToday);
    	    long diffSec = (endFormat.getTime() - startFormat.getTime()) / 1000; //초 차이
    	    long diffMin = (endFormat.getTime() - startFormat.getTime()) / 60000; //분 차이
    	    long diffHor = (endFormat.getTime() - startFormat.getTime()) / 3600000; //시 차이
    	    long all_Days_diff = diffSec / (24*60*60); //일자수 차이
    	   
    	    long today_diff_sec = (endFormat
    	    		.getTime() - todayformat.getTime()) / 1000;
    	    long today_diff = today_diff_sec / (24*60*60);
    			        		
    	    double all_days = all_Days_diff;
    	    double today =  today_diff;
    	    prog = 100-(int)((today / all_days)*100 );
        } catch (Exception e) {
        	e.printStackTrace();
        }
	    return prog;
	}
    
    
}