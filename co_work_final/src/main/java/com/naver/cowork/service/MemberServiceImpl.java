package com.naver.cowork.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Member;
import com.naver.cowork.mybatis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberMapper dao;

	@Autowired
	public MemberServiceImpl(MemberMapper dao ) {
		this.dao = dao;
	
	}


	@Override
	public int insert(Member m) {
		// TODO Auto-generated method stub
		return dao.insert(m);
	}


	@Override
	public int isId(String id) {
		 Member rmemer = dao.isId(id);
	     return (rmemer ==null)?-1:1;
	}


}