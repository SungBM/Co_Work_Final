package com.naver.cowork.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Edms;


@Mapper
public interface EdmsMapper {

	public List<Edms> getEdmsList();

	public List<Edms> getEdmsDetail();

	public Edms getApprovalOpinion(int apNumVal);

}
