package com.naver.cowork.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface EdmsService {

	public List<Map<String, Object>> getDocumentForm(String document_form_code);
	
	public List<Map<String, Object>> selectUserId(String document_form_code);

	public int updateOpinion(Map<String, String> data);
	
	public List<Map<String, Object>> selectBstripColumns(String document_form_code);

	public List<Map<String, Object>> selectApprovalLine(String document_form_code);


}
