package com.naver.cowork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Calendar;
import com.naver.cowork.mybatis.mapper.CalMapper;

@Service
public class CalServiceImpl implements CalService {

    private CalMapper dao;

    @Autowired
    public CalServiceImpl(CalMapper dao) {
        this.dao = dao;
    }

    public List<Calendar> calAll(String user_id) {
        return dao.calAll(user_id);
    }

    public int calInsert(Calendar calendar) {
        return dao.calInsert(calendar);
    }

    public int calUpdate(Calendar calendar) {
        return dao.calUpdate(calendar);
    }

    // 미구현
    public List<Calendar> calSelectList(String user_id, List<String> cal_type) {
        return dao.calSelectList(user_id, cal_type);
    }

    public int calDelete(int cal_no) {
        return dao.calDelete(cal_no);
    }


}