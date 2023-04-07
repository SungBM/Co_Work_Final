package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.mybatis.mapper.ChatMapper;

@Repository
public class ChatServiceImpl implements ChatService{
	
		
		@Autowired
		private ChatMapper dao;
		
		public ChatServiceImpl(ChatMapper dao) {
			this.dao = dao;
		}
		
		private String namespace = "com.naver.cowork.mybatis.mapper.ChatMapper";


//		@Override
//		public List<ChatVO> list() {
//			return dao.selectList(namespace + ".list");
//		}
//
//		@Override
//		public void insert(ChatVO vo) {
//			dao.insert(namespace + ".insert", vo);
//		}
//
//		@Override
//		public List<ChatVO> getChatList() {
//			return dao.selectList(namespace + ".getChatList");
//		}
		
		@Override
		   public int getRoom(String id, String userid) {

		      Map<String, Object> map = new HashMap<>();
		      map.put("user1", id);
		      map.put("user2", userid);
		      
		      Map<String, Object> result = dao.getRoom(map);
		      
		      if(result == null) {
		         return 0;
		      }else {
		         return Integer.parseInt(String.valueOf(result.get("ROOMNUMBER")));
		      }
		            
		   }


		@Override
		public List<ChatVO> list() {
			// TODO Auto-generated method stub
			return null;
		}


		@Override
		public void insert(ChatVO vo) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public List<ChatVO> getChatList() {
			// TODO Auto-generated method stub
			return null;
		}


		@Override
		public int createRoom(String id, String userid) {
			
			Map<String, Object> map = new HashMap<>();
		      map.put("user1", id);   //내 아ㅣ이디
		      map.put("user2", userid); //상대방 아이디
		      
		      int result = dao.createRoom(map);
		      
		      return Integer.parseInt(String.valueOf(result));
		}
		
}
