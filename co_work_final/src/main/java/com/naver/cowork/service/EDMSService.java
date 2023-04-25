package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Approval;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.EDMS;
import com.naver.cowork.domain.Member;

@Service
public interface EDMSService {

		// 글 목록
	public List<EDMS> getEdmsList(String docNum);

	public List<Approval> getEdmsDetail();

	public EDMS getApprovalOpinion(int apNumVal);
	
	public String insertBsTripForm(BsTrip bst);

	public List<Member> getAllUsersInfo(String loginId);

	public List<Dept> getDeptList();

	public Member getUsersInfo(String loginId);
	
	public String generateDocumentNumber();
	public List<EDMS> getMyDoc(Criteria cri);

	public List<EDMS> getMyDocApp(Criteria cri);

	public int getCountDoc(String user_id);

	public int getCountDocApp(String user_id);
	public List<EDMS> getAppLine(String document_no);
	

	public List<Map<String, Object>> getDocumentForm();
	
	public List<Map<String, Object>> selectUserId();

	
	public List<Map<String, Object>> selectBstripColumns();
	
	public List<Map<String, Object>> getDocumentForm(String document_form_code);
	
	public List<Map<String, Object>> selectUserId(String document_form_code);

	public int updateOpinion(Map<String, String> data);
	
	public List<Map<String, Object>> selectBstripColumns(String document_form_code);

	public List<Map<String, Object>> selectApprovalLine(String document_form_code);

	
}




