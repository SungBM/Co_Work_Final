package com.naver.cowork.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface EdmsService {

	public List<Map<String, Object>> getDocumentForm();
	
	public List<Map<String, Object>> selectUserId();

	public int updateOpinion(String opinion);
	
	public List<Map<String, Object>> selectBstripColumns();


}
