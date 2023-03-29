package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Member;

@Mapper
public interface MemberMapper {
	
	public Member isId(String id);

	public int insert(Member m);

	public int update(Member m);

	public void delete(String id);

	public int getSearchListCount(Map<String, String> map);

	public List<Member> getSearchList(Map<String, Object> map);
	
	public List<Member> members();

}
