package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.UserInfo;
import com.naver.cowork.mybatis.mapper.UserInfoMapper;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	private UserInfoMapper dao;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public UserInfoServiceImpl(UserInfoMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public int isId(String id, String password) {
		UserInfo rmember = dao.isId(id);
		int result = -1; 
		if (rmember != null) { 

			if (passwordEncoder.matches(password, rmember.getUSER_PASSWORD())) {
				result = 1;
			} else
				result = 0;
		}
		return result;
	}

	@Override
	public int insert(UserInfo m) {
		return dao.insert(m);
	}

	@Override
	public int isId(String id) {
		UserInfo rmember = dao.isId(id);
		return (rmember == null) ? -1 : 1; // -1�� ���̵� �������� �ʴ� ���
											// 1�� ���̵� �����ϴ� ���
	}

	@Override
	public UserInfo member_info(String id) {
		return dao.isId(id);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public int update(UserInfo m) {
		return dao.update(m);
	}

	@Override
	public List<UserInfo> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();

		// http://localhost:8088/myhome4/member/list�� �����ϴ� ���
		// select�� �������� �ʾ� index�� "-1"�� ���� �����ϴ�.
		// �� ��� �Ʒ��� ������ �������� �ʱ� ������ "search_field" Ű�� ����
		// map.get("search_field")�� ���� null�� �˴ϴ�.
		if (index != -1) {
			String[] search_field = new String[] { "id", "name", "age", "gender" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		if (index != -1) {
			String[] search_field = new String[] { "id", "name", "age", "gender" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		return dao.getSearchListCount(map);
	}

}