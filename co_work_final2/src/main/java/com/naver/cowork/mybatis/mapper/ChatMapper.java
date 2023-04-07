package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.ChatVO;

@Mapper
public interface ChatMapper {

	public List<ChatVO> list();
	
	public void insert(ChatVO vo);
	
	public Map<String, Object> getRoom(Map<String, Object> map);
	
	public int createRoom(Map<String, Object> map);
	
}


