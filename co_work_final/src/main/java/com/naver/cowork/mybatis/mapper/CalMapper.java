package com.naver.cowork.mybatis.mapper;

import com.naver.cowork.domain.Calendar;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CalMapper {

    public List<Calendar> calAll(String user_id);

    public int calInsert(Calendar calendar);

    public int calUpdate(Calendar calendar);

    // 미구현
    public List<Calendar> calSelectList(String user_id, List<String> cal_type);

    public int calDelete(int cal_no);

	public List<Calendar> calendarListForMain(String user_id);


}
