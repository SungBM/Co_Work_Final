package com.naver.cowork.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Edms;
import com.naver.cowork.service.EdmsService;

@Controller
@RequestMapping("/edms")
public class EDMSController {
	private static final Logger logger = LoggerFactory.getLogger(EDMSController.class);
	
	@Autowired
	private EdmsService edmsService;
	
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
}
	