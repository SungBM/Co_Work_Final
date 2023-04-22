package com.naver.cowork.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.ApprovalLine;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.DocumentForm;
import com.naver.cowork.domain.Member;

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



}
