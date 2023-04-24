package com.naver.cowork.service;


import com.naver.cowork.domain.Calendar;
import com.naver.cowork.mybatis.mapper.CalMapper;
import org.apache.ibatis.annotations.Delete;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

	@Transactional
	public int calInsert(Calendar calendar) {
		return dao.calInsert(calendar);
	}

	@Transactional
	public int calUpdate(Calendar calendar) {
		return dao.calUpdate(calendar);
	}

	// 미구현
	public List<Calendar> calSelectList(String user_id, List<String> cal_type) {
		return dao.calSelectList(user_id, cal_type);
	}

	@Transactional
	public int calDelete(int cal_no) {
		return dao.calDelete(cal_no);
	}

	public void alldayCheck(Calendar calendar) {
		if (calendar.getCal_allday() == null) {
			String start_full_date = calendar.getCal_start_date() + " " + calendar.getCal_start_time();
			String end_full_date = calendar.getCal_end_date() + " " + calendar.getCal_end_time();
			calendar.setCal_start_date(start_full_date);
			calendar.setCal_end_date(end_full_date);

		} else {
			// end 날짜가 하루 뒤어야 일정바가 날짜에 맞춰짐
			String end_full_date = calendar.getCal_end_date() + " " + calendar.getCal_end_time();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			LocalDateTime date = LocalDateTime.parse(end_full_date, formatter);
			LocalDateTime date2 = date.plusDays(1);
			calendar.setCal_end_date(date2.toString().substring(0, 10) + " " + date2.toString().substring(11, 16));
		}
	}

	public void typeCheck(Calendar calendar) {
		if (calendar.getCal_type().equals("C")) {
			calendar.setCal_color("#50A5F1");
		} else {
			calendar.setCal_color("#34C38F");
		}
	}

	@Override
	public List<Calendar> calendarListForMain(String user_id) {
		List<Calendar> list = dao.calendarListForMain(user_id);
		for( Calendar cal : list ) {
			cal.setCal_start_date(cal.getCal_start_date().substring(10,16));
			cal.setCal_end_date(cal.getCal_end_date().substring(10,16));
		}
		return list;
	}


}