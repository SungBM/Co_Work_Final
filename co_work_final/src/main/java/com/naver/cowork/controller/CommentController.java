package com.naver.cowork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.cowork.domain.Comment;
import com.naver.cowork.service.CommentService;

@RestController   
@RequestMapping(value="/comment")
public class CommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	private CommentService commentService;
	
	@Autowired
	public CommentController(CommentService commentService) {
		this.commentService=commentService;
	}
	
	@PostMapping(value="/list")
	public Map<String, Object> CommentList(int freeboard_num, int page){
		List<Comment> list = commentService.getCommentList(freeboard_num, page);
		int listcount = commentService.getFreeListCount(freeboard_num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("listcount", listcount);
		return map;
	}
	
	@PostMapping(value="/add")
	public int add(Comment comment) {
		logger.info("comment = " + comment);
		return commentService.commentsInsert(comment);
	}
	
	@PostMapping(value="/update")
		public int update(Comment co) {
			return commentService.commentsUpdate(co);
		}
	
	@PostMapping(value="/delete")
	public int CommentDelete(int num) {
		return commentService.commentsDelete(num);
	}
	
}
	

	
	