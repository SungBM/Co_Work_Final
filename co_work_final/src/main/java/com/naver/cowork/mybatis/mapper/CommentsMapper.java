package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Comment;

@Mapper
public interface CommentsMapper {

	public int getFreeListCount(int FREEBOARD_NUM);

	public List<Comment> getCommentList(Map<String, Integer> map);

	public int commentsInsert(Comment comment);

	public int commentsUpdate(Comment co);

	public int commentsDelete(int num);
}
