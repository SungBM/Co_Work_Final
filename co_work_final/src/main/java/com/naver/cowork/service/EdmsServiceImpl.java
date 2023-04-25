package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.naver.cowork.mybatis.mapper.EdmsMapper;

@Service
public class EdmsServiceImpl implements EdmsService {
    
    private EdmsMapper dao;

    public EdmsServiceImpl(EdmsMapper dao) {
        this.dao = dao;
    }

    @Override
    public List<Map<String, Object>> getDocumentForm(String document_form_code) {
        return dao.getDocumentForm(document_form_code);
    }
    
    @Override
    public List<Map<String, Object>> selectUserId(String document_form_code) {
        return dao.selectUserId(document_form_code);
    }
    
    @Override
    public int updateOpinion(Map<String, String> data){
        return dao.updateOpinion(data);
    }

	@Override
	public List<Map<String, Object>> selectBstripColumns(String document_form_code) {
		return dao.selectBstripColumns(document_form_code);
	}
	
	public List<Map<String, Object>> selectApprovalLine(String document_form_code){
		return dao.selectApprovalLine(document_form_code);
	}

}
