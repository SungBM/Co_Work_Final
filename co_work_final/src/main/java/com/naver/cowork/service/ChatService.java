package com.naver.cowork.service;

import java.util.List;

import com.naver.cowork.domain.ChatVO;

public interface ChatService {
	public List<ChatVO> list();
	
	public void insert(ChatVO vo);
	
	public List<ChatVO> getChatList();
}	
