package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int getListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		if(index != -1) {   // -1 선택된 값 없음.
			String[] search_field = new String[] {"notice_subject", "user_id"}; //어떤 컬럼을 넣어가야되는거야? member_list.jsp에 있는 아이디 이름 나이 성별.
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		return dao.getListCount(map);
	}


	@Override
	public List<Notice> getNoticeList(int index, String search_word, int page, int limit) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		if(index != -1) {   // -1 선택된 값 없음. 리스트 다 가져와.
			String[] search_field = new String[] {"notice_subject", "user_id"}; //어떤 컬럼을 넣어가야되는거야? member_list.jsp에 있는 아이디 이름 나이 성별.
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
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




	@Override
	public List<Notice> getNoticeListForMain() {
		// TODO Auto-generated method stub
		return dao.getNoticeListForMain();
	}


	@Override
	public boolean isNoticeWriter(int num, String pass) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("pass", pass);
		if(dao.isNoticeWriter(map) != null) {
			return true;
		}
		return false;
	}



	
	

}
