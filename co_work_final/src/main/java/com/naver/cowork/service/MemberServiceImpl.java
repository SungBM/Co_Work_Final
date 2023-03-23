package com.naver.cowork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Member;
import com.naver.cowork.mybatis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberMapper dao;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public MemberServiceImpl(MemberMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public int isId(String id, String password) {
		Member rmember = dao.isId(id);
		int result=-1; //아이디가 존재하지 않는 경우 -rmember가 null인 경우
		if(rmember!=null) { //아이디가 존재하는 경우
			//passwordEncoder.matches(rawPassword,encodePassword)
			//사용자에게 입력받은 패스워드를 비교하고자 할 때 사용하는 메서드입니다.
			//rawPassword : 사용자가 입력한 패스워드
			//encodePassword : DB에 저장된 패스워드
			if (passwordEncoder.matches(password,rmember.getPassword())) {
				result=1; //아이디와 비밀번호가 일치하는 경우
			}else
				result=0; //아이디는 존재하지만 비밀번호가 일치하지 않는 경우
		}
		return result;
	}

	@Override
	public int insert(Member m) {
		return dao.insert(m);
	}

	@Override
	public int isId(String id) {
		Member rmember = dao.isId(id);
		return (rmember == null) ? -1 : 1;  //-1은 아이디가 존재하지 않는 경우
											//1은 아이디가 존재하는 경우
	}

	@Override
	public Member member_info(String id) {
		return dao.isId(id);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	@Override
	public List<Member> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//http://localhost:8088/myhome4/member/list로 접속하는 경우
		//select를 선택하지 않아 index "-1"의 값을 찾습니다.
		//이 경우 아래의 문장을 수행하지 않기 때문에 "search_field" 키에 대한
		//map.get("search_field")의 값은 null이 됩니다.
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