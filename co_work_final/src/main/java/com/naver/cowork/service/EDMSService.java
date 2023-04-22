package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Member;

@Service
public interface EDMSService {

	public String insertBsTripForm(BsTrip bst);

	public List<Member> getAllUsersInfo(String loginId);

	public List<Dept> getDeptList();

	public Member getUsersInfo(String loginId);
	
	public String generateDocumentNumber();
}
