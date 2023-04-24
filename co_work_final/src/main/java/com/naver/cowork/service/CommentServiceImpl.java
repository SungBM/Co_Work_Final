package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Comment;
import com.naver.cowork.mybatis.mapper.CommentsMapper;

@Service
public class CommentServiceImpl implements CommentService{
	
	private CommentsMapper dao;
	
	@Autowired
	public CommentServiceImpl(CommentsMapper dao) {
		this.dao = dao;
	}
	
	@Override
	public int getFreeListCount(int FREEBOARD_NUM) {
		return dao.getFreeListCount(FREEBOARD_NUM);
	}

	@Override
	public List<Comment> getCommentList(int freeboard_num, int page) {
		int startrow=1;
		int endrow=page*3;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("freeboard_num", freeboard_num);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getCommentList(map);
	}

	@Override
	public int commentsInsert(Comment comment) {
		return dao.commentsInsert(comment);
	}

	@Override
	public int commentsUpdate(Comment co) {
		return dao.commentsUpdate(co);
	}

	@Override
	public int commentsDelete(int num) {
		return dao.commentsDelete(num);
	}

}
