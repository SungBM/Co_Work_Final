package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Notice;
import com.naver.cowork.mybatis.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper dao;
	
	
	@Autowired
	public NoticeServiceImpl(NoticeMapper dao) {
		this.dao = dao;
	}


	@Override
	public int getListCount() {
		return dao.getListCount();
	}


	@Override
	public List<Notice> getNoticeList(int page, int limit) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getNoticeList(map);
	}


	@Override
	public void insertNotice(Notice notice) {
		dao.insertNotice(notice);
	}
	
	@Override
	public Notice getNoticeDetail(int num) {
		return dao.getNoticeDetail(num);
	}


	@Override
	public int noticeModify(Notice modifyNotice) {
		return dao.noticeModify(modifyNotice);
	}


	@Override
	public int noticeDelete(int num) {
		int result=0;
		Notice notice = dao.getNoticeDetail(num);
		if(notice != null) {
			result=dao.noticeDelete(notice);
		}
		return result;
	}


	@Override
	public int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
	}





	
	

}
