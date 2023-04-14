package com.naver.cowork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Member;

@Service
public interface MemberService {


    public int isId(String user_id, String user_password);

    public Member member_info(String id);

//	public void delete(String id);

    public int mypageUpdate(Member m);

//	public List<Member> getSearchList(int index, String search_word, int page, int limit);

    //	public int getSearchListCount(int index, String search_word);
    
    // 전체 회원 조회
    public List<Member> members(Criteria cri);
    
    // 전체 회원 카운트
    public int getCount();

    public int insert(Member m);

    public int isId(String user_id);

    public int passUpdate(String user_id, String user_password);

    public int authUpdate(String user_id, String user_auth);

    public int stateUpdate(String user_id, String user_auth, String user_state);


    public int adminUpdate(Member member);

	public String user_img(String user_id);

}
