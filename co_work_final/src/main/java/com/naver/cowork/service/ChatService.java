package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import com.naver.cowork.domain.ChatVO;

public interface ChatService {
//	public List<ChatVO> list();
	
//	public void chatSave(ChatVO vo);
	
//	public List<ChatVO> getChatList();
	
	public int getRoom(String id, String userid);

	public int createRoom(String id, String userid);

	public int chatSave(int roomNumber, String chat_sender, String chat_content);
	
	public List<ChatVO> getList(int roomNumber);

	public List<Map<String, Object>> deptNames();
}	
