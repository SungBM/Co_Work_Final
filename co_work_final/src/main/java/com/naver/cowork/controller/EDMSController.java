package com.naver.cowork.controller;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.EDMS;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.PageDto;
import com.naver.cowork.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.script.ScriptContext;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/approval")
public class EDMSController {

    private static final Logger logger = LoggerFactory.getLogger(EDMSController.class);
    private MemberService memberservice;
    private DeptService deptservice;
    private JobService jobservice;
    private CompanyService companyservice;
    private MySaveFolder mysavefolder;
    private MeetingRoomService meetservice;
    private EDMSService edmsservice;

    @Autowired
    public EDMSController(MemberService memberService, DeptService deptservice, JobService jobservice,
                          MySaveFolder mysavefolder, CompanyService companyservice, MeetingRoomService meetservice, EDMSService edmsservice) {
        this.memberservice = memberService;
        this.deptservice = deptservice;
        this.jobservice = jobservice;
        this.mysavefolder = mysavefolder;
        this.companyservice = companyservice;
        this.meetservice = meetservice;
        this.edmsservice = edmsservice;
    }

    @GetMapping("/approvalList")
    public ModelAndView approvalList(ModelAndView mv, Principal principal, Criteria cri) {
        String user_id = principal.getName();
        cri.setUser_id(user_id);
        List<EDMS> docList = edmsservice.getMyDoc(cri);
        int getCountDoc = edmsservice.getCountDoc(user_id);
        int getCountDocApp = edmsservice.getCountDocApp(user_id);
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
        List<EDMS> docList = edmsservice.getMyDoc(cri);
        int total = edmsservice.getCountDoc(user_id);
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
        List<EDMS> docAppList = edmsservice.getMyDocApp(cri);
        int total = edmsservice.getCountDocApp(user_id);
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
        List<EDMS> getAppLine = edmsservice.getAppLine(document_no);
        return getAppLine;
    }

    @GetMapping("/searchMyDoc")
    public String searchMyDoc(){

        return "redirect:";
    }
}