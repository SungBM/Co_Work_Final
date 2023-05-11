package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.cowork.domain.Approval;
import com.naver.cowork.domain.ApprovalLine;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.DocumentForm;
import com.naver.cowork.domain.EDMS;
import com.naver.cowork.domain.Member;
import com.naver.cowork.mybatis.mapper.EDMSMapper;

@Service
public class EDMSServiceImpl implements EDMSService {
	private EDMSMapper dao;

	@Autowired
	public EDMSServiceImpl(EDMSMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<EDMS> getEdmsList(String docNum) {
		return dao.getEdmsList(docNum);
	}

	@Override
	public List<Approval> getEdmsDetail() {
		return dao.getEdmsDetail();
	}

	@Override
	public EDMS getApprovalOpinion(int apNumVal) {

		return dao.getApprovalOpinion(apNumVal);
	}

	@Override
	@Transactional
	public String insertBsTripForm(BsTrip bst) {
		String docNum = generateDocumentNumber();
		// document_form insert 값 설정
		DocumentForm docForm = new DocumentForm();
		int categoryNum = Integer.parseInt(GetDocumentCategoryName.BSTRIP.getNum());
		docForm.setDOCUMENT_FORM_CODE(docNum);
		docForm.setDOCUMENT_TITLE(bst.getDocumentName());
		docForm.setDOCUMENT_CATEGORY_NUM(categoryNum);
		System.out.println(bst.getUSERID() + "userid");
		docForm.setUSER_ID(bst.getUSERID());
		int re = dao.insertDocForm(docForm);
		// dao insert

		// approval_line insert 값 설정
		int i = 1;
		for (String manager : bst.getNameValues()) {
			ApprovalLine approval = new ApprovalLine();
			approval.setDOCUMENT_FORM_CODE(docNum);
			approval.setAPPROVAL_USER_ID(manager);
			System.out.println(manager);
			approval.setAPPROVAL_LEVEL(i);
			System.out.println(i);
			i++;

			re += dao.insertApproval(approval);
		}

		bst.setDOCUMENT_FORM_CODE(docNum);
		re += dao.insertBsTrip(bst);

		int compareRe = 2 + i;
		if (re == compareRe) {
			return "성공";
		} else {
			return "실패";
		}

	}
	/*
	 * public String generateDocumentNumber() { final String ALPHABET =
	 * "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; final String ALPHANUM = ALPHABET +
	 * "0123456789"; final int PREFIX_LENGTH = 5; final int SUFFIX_LENGTH = 7; final
	 * Random RANDOM = new Random(); StringBuilder sb = new StringBuilder(); for
	 * (int i = 0; i < PREFIX_LENGTH; i++) { int index =
	 * RANDOM.nextInt(ALPHABET.length()); sb.append(ALPHABET.charAt(index)); }
	 * sb.append('-'); for (int i = 0; i < SUFFIX_LENGTH; i++) { int index =
	 * RANDOM.nextInt(ALPHANUM.length()); sb.append(ALPHANUM.charAt(index)); }
	 * return sb.toString(); }
	 */

	public String generateDocumentNumber() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder randomString = new StringBuilder();
		for (int i = 0; i < 5; i++) {
			int index = (int) (characters.length() * Math.random());
			randomString.append(characters.charAt(index));
		}
		int sn = dao.getSerialNumber() + 1;
		String formatSn = String.format("%03d", sn);
		return "BST-" + randomString.toString() + "-" + formatSn;
	}

	@Override
	public List<Member> getAllUsersInfo(String loginId) {
		// TODO Auto-generated method stub
		return dao.getAllUsersInfo(loginId);
	}

	@Override
	public List<Dept> getDeptList() {
		List<Dept> deptList = dao.deptList();

		for (Dept dept : deptList) {
			List<Member> memberList = dao.getDeptMeberList(dept.getDept_name());
			dept.setDeptUser(memberList);
		}

		return deptList;
	}

	@Override
	public Member getUsersInfo(String loginId) {
		return dao.getUsersInfo(loginId);
	}

	public List<EDMS> getMyDoc(Criteria cri) {
		List<EDMS> docList = dao.getMyDoc(cri);
		for (EDMS e : docList) {
			if (e.getDOCUMENT_STATE() == edmsResultEnum.WAIT.getValue()) {
				e.setSTATE_RESULT("대기");
			} else if (e.getDOCUMENT_STATE() == edmsResultEnum.ING.getValue()) {
				e.setSTATE_RESULT("진행중");
			} else if (e.getDOCUMENT_STATE() == edmsResultEnum.REJECT.getValue()) {
				e.setSTATE_RESULT("반려");
			} else {
				e.setSTATE_RESULT(e.getAPPROVAL_DATE());
			}

			if (e.getDOCUMENT_CATEGORY_NUM() == edmsCategoryEnum.BSTRIP.getValue()) {
				e.setCATEGORY_RESULT("출장 신청서");
			}
		}
		return docList;
	}

	public List<EDMS> getMyDocApp(Criteria cri) {
		System.out.println(cri.getSkip() + "skip");
		System.out.println(cri.getViewSize() + "viewsize");

		List<EDMS> docAppList = dao.getMyDocApp(cri);
		for (EDMS e : docAppList) {
			if (e.getAPPROVAL_DATE() == null || e.getAPPROVAL_DATE() == "") {
				e.setAPPROVAL_DATE_RESULT("결재");
			} else {
				e.setAPPROVAL_DATE_RESULT("완료");
			}

			if (e.getDOCUMENT_CATEGORY_NUM() == edmsCategoryEnum.BSTRIP.getValue()) {
				e.setCATEGORY_RESULT("차량신청서");
			}
		}
		return docAppList;
	}

	public int getCountDoc(String user_id) {
		return dao.getCountDoc(user_id);
	}

	public int getCountDocApp(String user_id) {
		return dao.getCountDocApp(user_id);
	}

	public List<EDMS> getAppLine(String document_no) {
		List<EDMS> AppLine = dao.getAppLine(document_no);
		for (EDMS e : AppLine) {
			if (e.getAPPROVAL_STATE() == 0) {
				e.setSTATE_RESULT("결재안함");
			} else if (e.getAPPROVAL_STATE() == 1) {
				e.setSTATE_RESULT("결재완료");
			} else {
				e.setSTATE_RESULT("반려");
			}

			if (e.getAPPROVAL_DATE() != null) {
				e.setAPPROVAL_DATE_RESULT(e.getAPPROVAL_DATE());
			} else {
				e.setAPPROVAL_DATE_RESULT("-");
			}
		}
		return AppLine;
	}

	@Override
	public List<Map<String, Object>> getDocumentForm() {
		return dao.getDocumentForm();
	}

	@Override
	public List<Map<String, Object>> selectUserId() {
		return dao.selectUserId();
	}


	@Override
	public List<Map<String, Object>> selectBstripColumns() {
		return dao.selectBstripColumns2();
	}

	@Override
	public List<Map<String, Object>> getDocumentForm(String document_form_code) {
		return dao.getDocumentForm2(document_form_code);
	}

	@Override
	public List<Map<String, Object>> selectUserId(String document_form_code) {
		return dao.selectUserId2(document_form_code);
	}

	@Override
	@Transactional
	public int updateOpinion(Map<String, String> data) {
		 int re = dao.updateDocNowLevel(data);
		 re += dao.updateOpinion2(data);
		 return re;
	}

	@Override
	public List<Map<String, Object>> selectBstripColumns(String document_form_code) {
		return dao.selectBstripColumns2(document_form_code);
	}

	public List<Map<String, Object>> selectApprovalLine(String document_form_code) {
		return dao.selectApprovalLine2(document_form_code);
	}
}
