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
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Notice getDetail(int num) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int noticemodify(Notice modifynotice) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int noticeDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int setReadCountUpdate(int num) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public boolean isNoticeWriter(int num, String pass) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public List<Notice> getNoticeListForMain() {
		// TODO Auto-generated method stub
		return dao.getNoticeListForMain();
	}



	
	

}
