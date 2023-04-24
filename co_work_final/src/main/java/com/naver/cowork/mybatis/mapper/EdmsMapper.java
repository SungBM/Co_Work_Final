package com.naver.cowork.mybatis.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EdmsMapper {

	public List<Map<String, Object>> getDocumentForm();
	
	public List<Map<String, Object>> selectUserId();

	public int updateOpinion(String opinion);
	
	public List<Map<String, Object>> selectBstripColumns();
	
	

}
