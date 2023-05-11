package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Approval;
import com.naver.cowork.domain.ApprovalLine;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.DocumentForm;
import com.naver.cowork.domain.EDMS;
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

	public List<EDMS> getMyDoc(Criteria cri);

	public List<EDMS> getMyDocApp(Criteria cri);

	public int getCountDoc(String user_id);

	public int getCountDocApp(String user_id);

	public List<EDMS> getAppLine(String document_no);

	public List<EDMS> getEdmsList(String docNum);

	public List<Approval> getEdmsDetail();

	public EDMS getApprovalOpinion(int apNumVal);

	public List<Map<String, Object>> getDocumentForm();

	public List<Map<String, Object>> selectUserId();

	public List<Map<String, Object>> selectBstripColumns2();

	public List<Map<String, Object>> getDocumentForm2(String document_form_code);

	public List<Map<String, Object>> selectUserId2(String document_form_code);

	public int updateOpinion2(Map<String, String> data);

	public List<Map<String, Object>> selectBstripColumns2(String document_form_code);

	public List<Map<String, Object>> selectApprovalLine2(String document_form_code);

	int updateDocNowLevel(Map<String, String> data);

}
