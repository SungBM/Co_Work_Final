package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Edms;

@Service
public interface EdmsService {

		// 글 목록
	public List<Edms> getEdmsList();

	public List<Edms> getEdmsDetail();

	public Edms getApprovalOpinion(int apNumVal);
	
	
}




