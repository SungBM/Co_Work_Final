package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.ChatVO;

@Mapper
public interface ChatMapper {

//	public int chatSave(Map<String, Object> map);
	
	public Map<String, Object> getRoom(Map<String, Object> map);
	
	public int createRoom(Map<String, Object> map);

	public int chatSave(int roomNumber, String chat_sender, String chat_content);
	
	public List<ChatVO> getList(int roomNumber);

	public List<Map<String, Object>> deptNames();
	
	
}


