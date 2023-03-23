package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Member;

@Service
public interface MemberService {

	public int insert(Member m);

	public int isId(String id);

}
