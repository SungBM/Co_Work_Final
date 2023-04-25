package com.naver.cowork.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Edms;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public interface EdmsService {

	public String insertBsTripForm(BsTrip bst);

	public List<Member> getAllUsersInfo(String loginId);

	public List<Dept> getDeptList();

	public Member getUsersInfo(String loginId);
	
	public String generateDocumentNumber();
  public List<Edms> getMyDoc(Criteria cri);

  public List<Edms> getMyDocApp(Criteria cri);

  public int getCountDoc(String user_id);

  public int getCountDocApp(String user_id);
  public List<Edms> getAppLine(int document_no);

  public List<Edms> getEdmsDetail();

  public List<Edms> getEdmsList();

public Edms getApprovalOpinion(int apNumVal);

}