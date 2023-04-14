package com.naver.cowork.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Notice;

@Mapper
public interface NoticeMapper {
	
	//글 갯수
	public int getListCount(Map<String, String> map);

	//글 리스트
	public List<Notice> getNoticeList(HashMap<String, Object> map);
	
	//글 내용
	public Notice getNoticeDetail(int num);
	
	//글 등록
	public void insertNotice(Notice notice);
	
	// 글 수정
	public int noticeModify(Notice modifyNotice);
	
	//글 삭제
	public int noticeDelete(Notice notice);
	
	//조회수
	public int setReadCountUpdate(int num);
	

	public Notice isNoticeWriter(HashMap<String, Object> map);
	

	public List<Notice> getNoticeListForMain();

	
}
