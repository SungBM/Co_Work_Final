package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Member;

@Mapper
public interface MemberMapper {

    public Member isId(String id);

    public int insert(Member m);

    public int mypageUpdate(Member m);

    public void delete(String id);

    public int getSearchListCount(Map<String, String> map);

    public List<Member> getSearchList(Map<String, Object> map);

    public List<Member> members(Criteria cri);
    public int getCount();
    
    
    public int passUpdate(String user_id, String user_password);
    public int authUpdate(String user_id, String user_auth);

    public int stateUpdate(String user_id, String user_auth, String user_state);
    public int adminUpdate(Member member);

	public List<Map<String, Object>> searchList(String searchword);

	public String user_img(String user_id);


	


}
