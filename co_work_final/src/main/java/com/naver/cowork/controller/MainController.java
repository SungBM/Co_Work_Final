package com.naver.cowork.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Calendar;
import com.naver.cowork.domain.Notice;
import com.naver.cowork.domain.Project;
import com.naver.cowork.service.CalService;
import com.naver.cowork.service.NoticeService;
import com.naver.cowork.service.ProjectService;

@Controller
@RequestMapping("/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private ProjectService projectService;
	private CalService calservice;
	private NoticeService noticeService;
	
	@Autowired
	public MainController(ProjectService projectService, CalService calservice, NoticeService noticeService) {
		super();
		this.projectService = projectService;
		this.calservice = calservice;
		this.noticeService = noticeService;
	}



	@RequestMapping(value =  "/main" , method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv,String user_id ) {
		List<Notice> noticelist = noticeService.getNoticeListForMain();
		List<Project> projectList = projectService.getProjectListForMain();
		List<Calendar> calendarList = calservice.calendarListForMain(user_id);
		projectList = projectService.getProjectListWithProg(projectList);
		
		
		mv.addObject("noticelist",noticelist);
		mv.addObject("projectList",projectList);
		mv.addObject("calendarList",calendarList);
		logger.info("noticelist",noticelist);
		logger.info("projectList",projectList);
		logger.info("calendarList",calendarList);
		
		mv.setViewName("main/main");
		return mv;
	}
	
}
