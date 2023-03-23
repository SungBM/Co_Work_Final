package com.naver.cowork.service;

import java.util.List;

import com.naver.cowork.domain.UserInfo;

public interface UserInfoService {

	public int isId(String id, String pass);

	public int insert(UserInfo m);

	public int isId(String id);

	public UserInfo member_info(String id);

	public void delete(String id);

	public int update(UserInfo m);

	public List<UserInfo> getSearchList(int index, String search_word, int page, int limit);

	public int getSearchListCount(int index, String search_word);
}
