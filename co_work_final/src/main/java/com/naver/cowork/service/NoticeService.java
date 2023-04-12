package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Notice;

@Service
public interface NoticeService {

	// 글 갯수 카운팅
	public int getListCount(int index, String search_word);
	
	// 글 목록
	public List<Notice> getNoticeList(int index, String search_word, int page, int limit);
	
	// 글 등록
	public void insertNotice(Notice notice);
	
	// 상세뷰
	public Notice getNoticeDetail(int num);
	
	// 수정
	public int noticeModify(Notice modifyNotice);
	
	// 삭제
	public int noticeDelete(int num);
	
	// 조회수
	public int setReadCountUpdate(int num);
}