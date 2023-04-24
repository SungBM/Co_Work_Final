package com.naver.cowork.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.ApprovalLine;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.DocumentForm;
import com.naver.cowork.domain.Member;

import com.naver.cowork.domain.Calendar;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.EDMS;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;


@Mapper
public interface EDMSMapper {


	int insertDocForm(DocumentForm docForm);

	int insertApproval(ApprovalLine approval);

	int insertBsTrip(BsTrip bst);

	List<Member> getAllUsersInfo(String loginId);

	List<Dept> deptList();

	List<Member> getDeptMeberList(String dept_name);

	Member getUsersInfo(String loginId);

	int getSerialNumber();

  public List<EDMS> getMyDoc(Criteria cri);
    
  public List<EDMS> getMyDocApp(Criteria cri);

  public int getCountDoc(String user_id);

  public int getCountDocApp(String user_id);

  public List<EDMS> getAppLine(int document_no);



}
