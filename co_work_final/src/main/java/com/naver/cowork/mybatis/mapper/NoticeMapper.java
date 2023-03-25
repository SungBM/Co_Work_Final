package com.naver.cowork.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Notice;

@Mapper
public interface NoticeMapper {
	public List<Notice> noticeList();
}
