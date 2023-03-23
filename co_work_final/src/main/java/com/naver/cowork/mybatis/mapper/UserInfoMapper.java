package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.UserInfo;

@Mapper
public interface UserInfoMapper {

	public UserInfo isId(String id);

	public int insert(UserInfo m);

	public int update(UserInfo m);

	public void delete(String id);

	public int getSearchListCount(Map<String, String> map);

	public List<UserInfo> getSearchList(Map<String, Object> map);

}
