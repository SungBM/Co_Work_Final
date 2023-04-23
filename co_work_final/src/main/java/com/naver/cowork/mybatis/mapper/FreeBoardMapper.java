package com.naver.cowork.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.FreeBoard;

@Mapper
public interface FreeBoardMapper {
	
	//글 갯수 카운트
	public int getFreeListCount();
	
	//글 리스트
	public List<FreeBoard> freeBoardList(HashMap<String, Integer> map);

	public void insertFreeBoard(FreeBoard freeboard);

	public int setReadCountUpdate(int num);

	public FreeBoard getDetail(int num);

	public FreeBoard isFreeBoardWriter(HashMap<String, Object> map);

	public int freeBoardModify(FreeBoard freemodifyboard);

	public int freeBoardReply(FreeBoard freeboard);

	public int freeBoardReplyUpdate(FreeBoard freeboard);

	public int freeBoardDelete(FreeBoard freeboard);

}
