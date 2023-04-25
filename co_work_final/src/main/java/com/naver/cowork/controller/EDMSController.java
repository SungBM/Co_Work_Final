package com.naver.cowork.controller;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.script.ScriptContext;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.security.Principal;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Edms;
import com.naver.cowork.service.EdmsService;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.PageDto;
import com.naver.cowork.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Member;
import com.naver.cowork.service.EdmsService;


@Controller
@RequestMapping("/edms")
public class EDMSController {

	  private static final Logger logger = LoggerFactory.getLogger(EDMSController.class);
    private MemberService memberservice;
    private DeptService deptservice;
    private JobService jobservice;
    private CompanyService companyservice;
    private MySaveFolder mysavefolder;
    private MeetingRoomService meetservice;
    private EdmsService edmsService;
	
    @Autowired
    public EDMSController(MemberService memberService, DeptService deptservice, JobService jobservice,
                          MySaveFolder mysavefolder, CompanyService companyservice, MeetingRoomService meetservice, EdmsService edmsservice, EdmsService edmsService) {
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
		
	    List<Edms> edmslist = edmsService.getEdmsList();
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
		Edms edms = edmsService.getApprovalOpinion(apNumVal);
		
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
		
	    List<Edms> edmsdetail = edmsService.getEdmsDetail();

		mv.setViewName("edms/edms");
	    mv.addObject("edmsdetail", edmsdetail);
	    
	    return mv;
	}

  @GetMapping("/approvalList")
    public ModelAndView approvalList(ModelAndView mv, Principal principal, Criteria cri) {
        String user_id = principal.getName();
        cri.setUser_id(user_id);
        List<Edms> docList = edmsService.getMyDoc(cri);
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
        List<Edms> docList = edmsService.getMyDoc(cri);
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
        List<Edms> docAppList = edmsService.getMyDocApp(cri);
        int total = edmsService.getCountDocApp(user_id);
        PageDto pageMaker = new PageDto(cri, total);
        mv.addObject("docAppList", docAppList);
        mv.addObject("pageMaker", pageMaker);
        mv.setViewName("approval/myDocApp");
        return mv;
    }

    @ResponseBody
    @GetMapping("/getAppLine")
    public List<Edms> getAppLine(@RequestParam Map<String, Object> param, HttpServletResponse response) {
        int document_no = Integer.parseInt(String.valueOf(param.get("data")));
        List<Edms> getAppLine = edmsService.getAppLine(document_no);
        return getAppLine;
    }
  
  
  
}

