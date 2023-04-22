package com.naver.cowork.service;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.cowork.domain.ApprovalLine;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.DocumentForm;
import com.naver.cowork.domain.Member;
import com.naver.cowork.mybatis.mapper.EDMSMapper;
import com.naver.cowork.mybatis.mapper.MemberMapper;

@Service
public class EDMSServiceImpl implements EDMSService{
	private EDMSMapper dao;
	
	public EDMSServiceImpl(EDMSMapper dao) {
		super();
		this.dao = dao;
	}

	@Override
	@Transactional
	public String insertBsTripForm(BsTrip bst) {
		String docNum = generateDocumentNumber();
		//document_form insert 값 설정
		DocumentForm docForm = new DocumentForm();
		int categoryNum = Integer.parseInt(GetDocumentCategoryName.BSTRIP.getNum());
		docForm.setDOCUMENT_FORM_CODE(docNum);
		docForm.setDOCUMENT_TITLE(bst.getDocumentName());
		docForm.setDOCUMENT_CATEGORY_NUM(categoryNum);
		System.out.println(bst.getUSERID()+"userid");
		docForm.setUSER_ID(bst.getUSERID());
		int re = dao.insertDocForm(docForm);
		//dao insert
		
		//approval_line insert 값 설정
		int i = 1;
		for( String manager : bst.getNameValues()) {
			ApprovalLine approval = new ApprovalLine();
			approval.setDOCUMENT_FORM_CODE(docNum);
			approval.setAPPROVAL_USER_ID(manager);
			System.out.println(manager);
			approval.setAPPROVAL_LEVEL(i);
			System.out.println(i); i++;
			
			re += dao.insertApproval(approval);
		}
		
		bst.setDOCUMENT_FORM_CODE(docNum);
		re += dao.insertBsTrip(bst);
		
		int compareRe = 2 + i;
		if(re == compareRe) {
			return "성공";
		} else {
			return "실패";
		}
		
	}
/*
	public String generateDocumentNumber() {
	    final String ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    final String ALPHANUM = ALPHABET + "0123456789";
	    final int PREFIX_LENGTH = 5;
	    final int SUFFIX_LENGTH = 7;
	    final Random RANDOM = new Random();

	    StringBuilder sb = new StringBuilder();
	    for (int i = 0; i < PREFIX_LENGTH; i++) {
	        int index = RANDOM.nextInt(ALPHABET.length());
	        sb.append(ALPHABET.charAt(index));
	    }
	    sb.append('-');
	    for (int i = 0; i < SUFFIX_LENGTH; i++) {
	        int index = RANDOM.nextInt(ALPHANUM.length());
	        sb.append(ALPHANUM.charAt(index));
	    }
	    return sb.toString();
	}
*/
	
	public String generateDocumentNumber() {
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    StringBuilder randomString = new StringBuilder();
	    for (int i = 0; i < 5; i++) {
	        int index = (int)(characters.length() * Math.random());
	        randomString.append(characters.charAt(index));
	    }
	    int sn = dao.getSerialNumber()+1;
	    String formatSn = String.format("%03d", sn);
	    return "BST-" + randomString.toString() + "-" +formatSn;
	}
	@Override
	public List<Member> getAllUsersInfo(String loginId) {
		// TODO Auto-generated method stub
		return dao.getAllUsersInfo(loginId);
	}

	@Override
	public List<Dept> getDeptList() {
		List<Dept> deptList = dao.deptList();
		
		for (Dept dept : deptList ) {
			List<Member> memberList = dao.getDeptMeberList(dept.getDept_name());
			dept.setDeptUser(memberList);
		}
		
		return deptList;
	}

	@Override
	public Member getUsersInfo(String loginId) {
		return dao.getUsersInfo(loginId);
	}

	
}
