package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Notice;

@Service
public interface NoticeService {
	public List<Notice> noticeList();
	
	
}


