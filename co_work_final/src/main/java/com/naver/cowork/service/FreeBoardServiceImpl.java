package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.FreeBoard;
import com.naver.cowork.mybatis.mapper.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	private FreeBoardMapper dao;
	
	@Autowired
	public FreeBoardServiceImpl(FreeBoardMapper dao) {
		this.dao = dao;
	}
	
	@Override
	public int getFreeListCount() {
		return dao.getFreeListCount();
	}

	@Override
	public List<FreeBoard> freeBoardList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.freeBoardList(map);
	}

	@Override
	public void insertFreeBoard(FreeBoard freeboard) {
		dao.insertFreeBoard(freeboard);
		
	}

	@Override
	public int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
		
	}

	@Override
	public FreeBoard getDetail(int num) {
		return dao.getDetail(num);
	}

	@Override
	public boolean isFreeBoardWriter(int num, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("pass", pass);
		FreeBoard result = dao.isFreeBoardWriter(map);
		if(result==null)
			return false;
		else
			return true;
	}

	@Override
	public int freeBoardModify(FreeBoard freemodifyboard) {
		return dao.freeBoardModify(freemodifyboard);
	}

	@Override
	public int freeBoardReply(FreeBoard freeboard) {
		freeBoardReplyUpdate(freeboard);
		
		freeboard.setFREEBOARD_RE_LEV(freeboard.getFREEBOARD_RE_LEV()+1);
		freeboard.setFREEBOARD_RE_SEQ(freeboard.getFREEBOARD_RE_SEQ()+1);
		return dao.freeBoardReply(freeboard);
	}

	public int freeBoardReplyUpdate(FreeBoard freeboard) {
		return dao.freeBoardReplyUpdate(freeboard);
		
	}

	@Override
	public int freeBoardDelete(int num) {
		int result=0;
		FreeBoard freeboard = dao.getDetail(num);
		if(freeboard != null) {
			result = dao.freeBoardDelete(freeboard);
		}
		return result;
	}


}
