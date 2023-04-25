 package com.naver.cowork.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Dept;
import com.naver.cowork.service.DeptService;
import com.naver.cowork.service.EdmsService;

@Controller
@RequestMapping("/edms")
public class EDMSController {
	private static final Logger logger = LoggerFactory.getLogger(EDMSController.class);
	
	private EdmsService edmsService;

	private DeptService deptService;
	
	@Autowired
	public EDMSController(EdmsService edmsService, DeptService deptServcie, DeptService deptService) {
		super();
		this.edmsService = edmsService;
		this.deptService = deptService;
	}
	
	//전자결재 상세 페이지로 이동
	@GetMapping("/edmsaddcomments")
	public ModelAndView getEdmsDetail(ModelAndView mv, String document_form_code, String approval_user_id, Principal principal) {
	List<Map<String, Object>> documentsList = edmsService.getDocumentForm(document_form_code);  // 매개변수 입력해야함.  document_form_code
	List<Map<String, Object>> usersList = edmsService.selectUserId(document_form_code);  // 매개변수 입력해야함.  document_form_code
	List<Map<String, Object>> bstripList = edmsService.selectBstripColumns(document_form_code);   // 매개변수 입력해야함.  approval_num+approval_user_id
	//List<Map<String, Object>> approvalList = edmsService.selectApprovalLine(document_form_code);  // 결재라인 가져오는
	String user_id = principal.getName();
	if(documentsList != null && !documentsList.isEmpty() && usersList != null && !usersList.isEmpty() && bstripList != null && !bstripList.isEmpty()) {
	    Map<String, Object> documents = documentsList.get(0);
	    Map<String, Object> users = usersList.get(0);
	    Map<String, Object> bstrip = bstripList.get(0); 

	    mv.addObject("documents", documents);
	    mv.addObject("users", users);
	    mv.addObject("bstrip", bstrip); 
	    mv.addObject("approval", usersList);
	    mv.addObject("userId", user_id);

	    System.out.println("현재 가져온 documents 정보 : " + documents);
	    System.out.println("현재 가져온 users 정보 : " + users);
	    System.out.println("현재 가져온 bstrip 정보 : " + bstrip); 
	    System.out.println("현재 가져온 approval 정보 : " + usersList); 
	    System.out.println("현재 가져온 userId 정보 : " + user_id); 
	} else {
	    System.out.println("문서 정보, 사용자 정보 또는 BSTRIP 정보를 가져올 수 없습니다.");
	}
	mv.setViewName("edms/edms_add_Comments");
	return mv;
	}

	public enum DocumentStateEnum {
	    IN_PROGRESS(0, "진행중"),
	    REJECTED(-1, "반려"),
	    COMPLETED(1, "완료");

	    private final int value;
	    private final String label;

	    DocumentStateEnum(int value, String label) {
	        this.value = value;
	        this.label = label;
	    }

	    public int getValue() {
	        return value;
	    }

	    public String getLabel() {
	        return label;
	    }

	    public static DocumentStateEnum valueOf(int value) {
	        for (DocumentStateEnum e : values()) {
	            if (e.value == value) {
	                return e;
	            }
	        }
	        throw new IllegalArgumentException("Invalid DocumentStateEnum value: " + value);
	    }
	}

	//의견 달기
	@PostMapping("/edmsdetail")
	public ModelAndView updateOpinion(ModelAndView mv,
		    @RequestParam("approvalOpinion") String approvalOpinion,
		    @RequestParam("DOCUMENT_FORM_CODE") String document_form_code,
		    Principal principal) {
	    List<Map<String, Object>> documentsList = edmsService.getDocumentForm(document_form_code);
	    List<Map<String, Object>> usersList = edmsService.selectUserId(document_form_code);
	    List<Map<String, Object>> bstripList = edmsService.selectBstripColumns(document_form_code);
		String user_id = principal.getName(); // 접속중인 id 가져오기
		Map<String, String> data = new HashMap<String, String>();
		data.put("opinion", approvalOpinion);
		data.put("document_form_code", document_form_code);
		data.put("approval_user_id", user_id);
	    edmsService.updateOpinion(data);

	    if(documentsList != null && !documentsList.isEmpty() && usersList != null && !usersList.isEmpty() && bstripList != null && !bstripList.isEmpty()) {
	        Map<String, Object> documents = documentsList.get(0);
	        Map<String, Object> users = usersList.get(0);
	        Map<String, Object> bstrip = bstripList.get(0);

	        mv.addObject("documents", documents);
	        mv.addObject("users", users);
	        mv.addObject("bstrip", bstrip);

	        System.out.println("현재 가져온 documents 정보 : " + documents);
	        System.out.println("현재 가져온 users 정보 : " + users);
	        System.out.println("현재 가져온 bstrip 정보 : " + bstrip);
	    } else {
	        System.out.println("문서 정보, 사용자 정보 또는 BSTRIP 정보를 가져올 수 없습니다.");
	    }
	    
	    mv.setViewName("edms/edms_Detail");
	    return mv;
	}





	   }
	   
	   
