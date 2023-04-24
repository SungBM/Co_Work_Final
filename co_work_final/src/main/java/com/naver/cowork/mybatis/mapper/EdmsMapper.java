package com.naver.cowork.mybatis.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EdmsMapper {

	public List<Map<String, Object>> getDocumentForm(String document_form_code);
	
	public List<Map<String, Object>> selectUserId(String document_form_code);

	public int updateOpinion(Map<String, String> data);
	
	public List<Map<String, Object>> selectBstripColumns(String document_form_code);
	
	public List<Map<String, Object>> selectApprovalLine(String document_form_code);

}
