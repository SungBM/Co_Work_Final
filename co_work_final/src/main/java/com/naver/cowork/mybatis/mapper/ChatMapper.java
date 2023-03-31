package com.naver.cowork.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.ChatVO;

@Mapper
public interface ChatMapper {

	public List<ChatVO> list();
	
	public void insert(ChatVO vo);
	
}


