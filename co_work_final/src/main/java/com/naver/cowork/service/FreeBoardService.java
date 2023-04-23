package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;

import com.naver.cowork.domain.FreeBoard;

public interface FreeBoardService {
	
	
	//글 갯수 카운팅
	public int getFreeListCount();
	
	//글 리스트
	public List<FreeBoard> freeBoardList(int page, int limit);
	
	//글 추가
	public void insertFreeBoard(FreeBoard freeboard);
	
	//조회수
	public int setReadCountUpdate(int num);

	public FreeBoard getDetail(int num);

	public boolean isFreeBoardWriter(int num, String pass);

	public int freeBoardModify(FreeBoard freemodifyboard);

	public int freeBoardReply(FreeBoard freeboard);

	public int freeBoardDelete(int num);

}
