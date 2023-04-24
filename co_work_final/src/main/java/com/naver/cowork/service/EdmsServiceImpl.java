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
    public List<Map<String, Object>> getDocumentForm() {
        return dao.getDocumentForm();
    }
    
    @Override
    public List<Map<String, Object>> selectUserId() {
        return dao.selectUserId();
    }
    
    @Override
    public int updateOpinion(String opinion) {
        return dao.updateOpinion(opinion);
    }

	@Override
	public List<Map<String, Object>> selectBstripColumns() {
		return dao.selectBstripColumns();
	}

}
