package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Member;

@Service
public interface MemberService {


	public int isId(String id, String pass);

	public Member member_info(String id);

//	public void delete(String id);

	public int update(Member m);

//	public List<Member> getSearchList(int index, String search_word, int page, int limit);

//	public int getSearchListCount(int index, String search_word);
public List<Member> members();

	public int insert(Member m);

	public int isId(String id);


}
