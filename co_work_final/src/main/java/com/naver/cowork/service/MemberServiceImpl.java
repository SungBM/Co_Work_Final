package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Member;
import com.naver.cowork.mybatis.mapper.MemberMapper;
import org.springframework.transaction.annotation.Transactional;

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
        int result = -1;
        System.out.print(id);
        if (rmember != null) {
            if (passwordEncoder.matches(password, rmember.getUser_password())) {
                result = 1;
            } else
                result = 0;
        }
        return result;
    }


    @Override
    public Member member_info(String id) {
        return dao.isId(id);
    }

    //	@Override
//	public void delete(String id) {
//		dao.delete(id);
//	}
//
    @Transactional
    public int mypageUpdate(Member m) {
        return dao.mypageUpdate(m);
    }


//	@Override
//	public List<Member> getSearchList(int index, String search_word, int page, int limit) {
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		// http://localhost:8088/myhome4/member/list�� �����ϴ� ���
//		// select�� �������� �ʾ� index�� "-1"�� ���� �����ϴ�.
//		// �� ��� �Ʒ��� ������ �������� �ʱ� ������ "search_field" Ű�� ����
//		// map.get("search_field")�� ���� null�� �˴ϴ�.
//		if (index != -1) {
//			String[] search_field = new String[] { "id", "name", "age", "gender" };
//			map.put("search_field", search_field[index]);
//			map.put("search_word", "%" + search_word + "%");
//		}
//		int startrow = (page - 1) * limit + 1;
//		int endrow = startrow + limit - 1;
//		map.put("start", startrow);
//		map.put("end", endrow);
//		return dao.getSearchList(map);
//	}
//
//	@Override
//	public int getSearchListCount(int index, String search_word) {
//		Map<String, String> map = new HashMap<String, String>();
//		if (index != -1) {
//			String[] search_field = new String[] { "id", "name", "age", "gender" };
//			map.put("search_field", search_field[index]);
//			map.put("search_word", "%" + search_word + "%");
//		}
//		return dao.getSearchListCount(map);
//	}

    public List<Member> members(Criteria cri){
        return dao.members(cri);
    }
    
    public int getCount() {
    	return dao.getCount();
    }

    public int insert(Member m) {
        // TODO Auto-generated method stub
        return dao.insert(m);
    }

    public int isId(String id) {
        Member rmemer = dao.isId(id);
        return (rmemer == null) ? -1 : 1;
    }

    @Transactional
    public int passUpdate(String user_id, String user_password) {
        return dao.passUpdate(user_id, user_password);
    }

    @Transactional
    public int authUpdate(String user_id, String user_auth) {
        return dao.authUpdate(user_id, user_auth);
    }

    @Transactional
    public int stateUpdate(String user_id, String user_auth, String user_state) {
        return dao.stateUpdate(user_id, user_auth, user_state);
    }

    @Transactional
    public int adminUpdate(Member member) {
        return dao.adminUpdate(member);
    }

	@Override
	public String user_img(String user_id) {
		return dao.user_img(user_id);
	}
    
    
    //채팅필드 회원검색
//	@Override
//	public List<Map<String, Object>> searchList(String searchword) {
//		return dao.searchList(searchword);
//	}



}