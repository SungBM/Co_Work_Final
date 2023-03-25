package com.naver.cowork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.naver.cowork.domain.Notice;
import com.naver.cowork.mybatis.mapper.MemberMapper;

public class NoticeListImpl implements NoticeService {
	private MemberMapper dao;
	
	
	@Autowired
	public NoticeListImpl(MemberMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<Notice> noticeList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
