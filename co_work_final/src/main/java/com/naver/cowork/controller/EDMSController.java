package com.naver.cowork.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.BsTrip;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Member;
import com.naver.cowork.service.EDMSService;

@Controller
@RequestMapping("/edms")
public class EDMSController {
	private static final Logger logger = LoggerFactory.getLogger(EDMSController.class);
	private EDMSService edmsService;
	
	@Autowired
	public EDMSController(EDMSService edmsService) {
		super();
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
	@GetMapping("/edmsList")
	public ModelAndView edmsList(ModelAndView mv) {
		mv.setViewName("edms/edmsList");
		
		return mv;
	}
}
