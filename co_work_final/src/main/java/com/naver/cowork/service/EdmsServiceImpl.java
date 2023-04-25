package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Edms;
import com.naver.cowork.domain.Member;
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


	@Override
	public String insertBsTripForm(BsTrip bst) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Member> getAllUsersInfo(String loginId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Dept> getDeptList() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Member getUsersInfo(String loginId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String generateDocumentNumber() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Edms> getMyDoc(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Edms> getMyDocApp(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getCountDoc(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getCountDocApp(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Edms> getAppLine(int document_no) {
		// TODO Auto-generated method stub
		return null;
	}
}
