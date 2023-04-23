package com.naver.cowork.service;

import java.util.List;

import com.naver.cowork.domain.Comment;

public interface CommentService {

	public int getFreeListCount(int FREEBOARD_NUM);

	public List<Comment> getCommentList(int freeboard_num, int page);

	public int commentsInsert(Comment comment);

	public int commentsUpdate(Comment co);

	public int commentsDelete(int num);
	
}
