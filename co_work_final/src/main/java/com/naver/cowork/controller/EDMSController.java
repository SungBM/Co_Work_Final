package com.naver.cowork.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Approval;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.EDMS;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.PageDto;
import com.naver.cowork.service.CompanyService;
import com.naver.cowork.service.DeptService;
import com.naver.cowork.service.EDMSService;
import com.naver.cowork.service.JobService;
import com.naver.cowork.service.MeetingRoomService;
import com.naver.cowork.service.MemberService;


@Controller
@RequestMapping("/edms")
public class EDMSController {

	private static final Logger logger = LoggerFactory.getLogger(EDMSController.class);
	private EDMSService edmsService;
    private MemberService memberservice;
    private DeptService deptservice;
    private JobService jobservice;
    private CompanyService companyservice;
    private MySaveFolder mysavefolder;
    private MeetingRoomService meetservice;
	
    @Autowired
    public EDMSController(MemberService memberService, DeptService deptservice, JobService jobservice,
                          MySaveFolder mysavefolder, CompanyService companyservice, MeetingRoomService meetservice, EDMSService edmsService) {
        this.memberservice = memberService;
        this.deptservice = deptservice;
        this.jobservice = jobservice;
        this.mysavefolder = mysavefolder;
        this.companyservice = companyservice;
        this.meetservice = meetservice;
        this.edmsService = edmsService;
    }

	@GetMapping("/edmsApprovalLine")
	public ModelAndView edmsApprovalLine(ModelAndView mv,Principal principal) {
		String loginId = principal.getName();
		Member loginUser = edmsService.getUsersInfo(loginId);
		List<Dept> deptList = edmsService.getDeptList();
		String docNum = edmsService.generateDocumentNumber();
    
		
		mv.addObject("loginUser",loginUser);
		mv.addObject("deptList",deptList);
		mv.addObject("docNum",docNum);
		mv.setViewName("edms/CreateEdms");
		
		return mv;
	}
	
	@GetMapping("/addBsTrip")
	public String addBsTrip(BsTrip bst,Principal principal) {
		bst.setUSERID(principal.getName());
		edmsService.insertBsTripForm(bst);
		
		return "main/main";
	}
	
	@GetMapping("/edmsCreateNew")
	public ModelAndView edmsCreateNew(ModelAndView mv) {
		mv.setViewName("edms/createNewPopup");
		
		return mv;
	}

  @RequestMapping(value = "/edmsList", method=RequestMethod.GET)
	public ModelAndView edmsList(ModelAndView mv) {
		
	    List<Approval> edmslist = edmsService.getEdmsList();
	    String docNum = edmslist.get(0).getDOCUMENT_FORM_CODE();
	    
		mv.setViewName("edms/edms");
		mv.addObject("docNum",docNum);
	    mv.addObject("edmslist", edmslist);
	    
	    return mv;
	}
	@RequestMapping(value = "/approvalOpinion", method=RequestMethod.GET)
	public void approvalOpinion(HttpServletResponse response,String apNum) throws Exception{
		int apNumVal = 0;
		if( apNum != null ) {
			apNumVal = Integer.parseInt(apNum);
		}
		Approval edms = edmsService.getApprovalOpinion(apNumVal);
		
		String edmsVal = edms.getAPPROVAL_STATE() + "@";
		edmsVal += edms.getUSER_CARD() + "@";
		edmsVal += edms.getAPPROVAL_OPINION()+ "@";
		edmsVal += edms.getAPPROVAL_DATE();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(edmsVal);
		
	}
	
	@RequestMapping(value = "/edmsDetail", method=RequestMethod.GET)
	public ModelAndView edmsDetail(ModelAndView mv) {
		
	    List<Approval> edmsdetail = edmsService.getEdmsDetail();

		mv.setViewName("edms/edms");
	    mv.addObject("edmsdetail", edmsdetail);
	    
	    return mv;
	}

  @GetMapping("/approvalList")
    public ModelAndView approvalList(ModelAndView mv, Principal principal, Criteria cri) {
        String user_id = principal.getName();
        cri.setUser_id(user_id);
        List<EDMS> docList = edmsService.getMyDoc(cri);
        int getCountDoc = edmsService.getCountDoc(user_id);
        int getCountDocApp = edmsService.getCountDocApp(user_id);
        mv.addObject("docList", docList);
        mv.addObject("getCountDoc", getCountDoc);
        mv.addObject("getCountDocApp", getCountDocApp);
        mv.setViewName("approval/approvalList");
        return mv;
    }

    @GetMapping("/myDoc")
    public ModelAndView myDoc(ModelAndView mv, Principal principal, Criteria cri) {
        String user_id = principal.getName();
        cri.setUser_id(user_id);
        cri.setEndDate(cri.getEndDate() + " 23:59:59");
        logger.info(cri.getSearchSelect());
        List<EDMS> docList = edmsService.getMyDoc(cri);
        int total = edmsService.getCountDoc(user_id);
        PageDto pageMaker = new PageDto(cri, total);
        mv.addObject("docList", docList);
        mv.addObject("pageMaker", pageMaker);
        mv.setViewName("approval/myDoc");
        return mv;
    }

    @GetMapping("/myDocApp")
    public ModelAndView myDocApp(ModelAndView mv, Principal principal, Criteria cri) {
        String user_id = principal.getName();
        cri.setUser_id(user_id);
        cri.setEndDate(cri.getEndDate() + " 23:59:59");
        logger.info(cri.getSearchSelect());
        List<EDMS> docAppList = edmsService.getMyDocApp(cri);
        int total = edmsService.getCountDocApp(user_id);
        PageDto pageMaker = new PageDto(cri, total);
        mv.addObject("docAppList", docAppList);
        mv.addObject("pageMaker", pageMaker);
        mv.setViewName("approval/myDocApp");
        return mv;
    }

    @ResponseBody
    @GetMapping("/getAppLine")
    public List<EDMS> getAppLine(@RequestParam Map<String, Object> param, HttpServletResponse response) {
        int document_no = Integer.parseInt(String.valueOf(param.get("data")));
        List<EDMS> getAppLine = edmsService.getAppLine(document_no);
        return getAppLine;
    }
  
  	@GetMapping("/edmsaddcomments")
	public ModelAndView getEdmsDetail(ModelAndView mv) {
	List<Map<String, Object>> documentsList = edmsService.getDocumentForm();
	List<Map<String, Object>> usersList = edmsService.selectUserId();
	List<Map<String, Object>> bstripList = edmsService.selectBstripColumns(); 
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
		public ModelAndView updateOpinion(@RequestParam("approvalOpinion") ModelAndView mv, String approvalOpinion) {
		List<Map<String, Object>> documentsList = edmsService.getDocumentForm();
		List<Map<String, Object>> usersList = edmsService.selectUserId();
		List<Map<String, Object>> bstripList = edmsService.selectBstripColumns(); 
		edmsService.updateOpinion(approvalOpinion);
		if(documentsList != null && !documentsList.isEmpty() && usersList != null && !usersList.isEmpty() && bstripList != null && !bstripList.isEmpty()) {
		    Map<String, Object> documents = documentsList.get(0);
		    Map<String, Object> users = usersList.get(0);
		    Map<String, Object> bstrip = bstripList.get(0); 
//test1
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
  
  
}

