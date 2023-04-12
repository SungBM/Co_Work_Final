package com.naver.cowork.service;

import com.naver.cowork.domain.Calendar;
import com.naver.cowork.domain.Dept;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CalService {

    public List<Calendar> calAll(String user_id);

    public int calInsert(Calendar calendar);

    public int calUpdate(Calendar calendar);

    // 미구현
    public List<Calendar> calSelectList(String user_id, List<String> cal_type);

    public int calDelete(int cal_no);



	public List<Calendar> calendarListForMain(String user_id);



    // allday Check 확인
	public void alldayCheck(Calendar calendar);
	// type Check 확인
	public void typeCheck(Calendar calendar);
	

}

