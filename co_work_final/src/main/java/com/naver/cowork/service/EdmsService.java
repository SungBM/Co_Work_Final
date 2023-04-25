package com.naver.cowork.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.EDMS;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public interface EDMSService {

	public String insertBsTripForm(BsTrip bst);

	public List<Member> getAllUsersInfo(String loginId);

	public List<Dept> getDeptList();

	public Member getUsersInfo(String loginId);
	
	public String generateDocumentNumber();
  public List<EDMS> getMyDoc(Criteria cri);

  public List<EDMS> getMyDocApp(Criteria cri);

  public int getCountDoc(String user_id);

  public int getCountDocApp(String user_id);
  public List<EDMS> getAppLine(int document_no);
