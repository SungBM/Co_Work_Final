package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Edms;
import com.naver.cowork.mybatis.mapper.EdmsMapper;

@Service
public class EdmsServiceImpl implements EdmsService {
	private EdmsMapper dao;
	
	
	@Autowired
	public EdmsServiceImpl(EdmsMapper dao) {
		this.dao = dao;
	}


	@Override
	public List<Edms> getEdmsList() {
        return dao.getEdmsList();
	}


	@Override
	public List<Edms> getEdmsDetail() {
        return dao.getEdmsDetail();
        }


	@Override
	public Edms getApprovalOpinion(int apNumVal) {

		return dao.getApprovalOpinion(apNumVal);
	}
}
