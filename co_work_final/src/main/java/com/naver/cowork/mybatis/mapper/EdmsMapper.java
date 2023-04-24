package com.naver.cowork.mybatis.mapper;

import java.util.List;

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

	public List<Map<String, Object>> getDocumentForm();
	
	public List<Map<String, Object>> selectUserId();

	public int updateOpinion(String opinion);
	
	public List<Map<String, Object>> selectBstripColumns();
  
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

	public List<Approval> getEdmsList();

	public List<Approval> getEdmsDetail();

	public Approval getApprovalOpinion(int apNumVal);

}
