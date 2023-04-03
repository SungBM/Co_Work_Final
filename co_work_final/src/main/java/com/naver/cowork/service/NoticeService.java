package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Notice;

@Service
public interface NoticeService {

	// 글 갯수 카운팅
	public int getListCount();
	
	// 글 목록
	public List<Notice> getNoticeList(int page, int limit);
	
	// 글 등록
	public void insertNotice(Notice notice);
	
	// 상세뷰
	public Notice getDetail(int num);
	
	// 수정
	public int noticemodify(Notice modifynotice);
	
	// 삭제
	public int noticeDelete(int num);
	
	// 조회수
	public int setReadCountUpdate(int num);
	
	// 작성자 본인 확인
	public boolean isNoticeWriter(int num, String pass);
	
	
}


