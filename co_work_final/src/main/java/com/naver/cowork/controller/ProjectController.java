 package com.naver.cowork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_User;
import com.naver.cowork.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger Logger = LoggerFactory.getLogger(ProjectController.class);
	
	private ProjectService projectService;
	
	@Autowired
	public ProjectController(ProjectService projectService) {
		super();
		this.projectService = projectService;
	}

	public int getDayCount(String date1, String date2) {
		int prog = 0;
		
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        try {
        	Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
    	    Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(date2);
    	    Date todayformat = new SimpleDateFormat("yyyy-MM-dd").parse(strToday);
    	    long diffSec = (format2.getTime() - format1.getTime()) / 1000; //초 차이
    	    long diffMin = (format2.getTime() - format1.getTime()) / 60000; //분 차이
    	    long diffHor = (format2.getTime() - format1.getTime()) / 3600000; //시 차이
    	    long all_Days_diff = diffSec / (24*60*60); //일자수 차이
    	   
    	    long today_diff_sec = (format2.getTime() - todayformat.getTime()) / 1000;
    	    long today_diff = today_diff_sec / (24*60*60);
    			        		
    	    double all_days = all_Days_diff;
    	    double today =  today_diff;
    	    prog = 100-(int)((today / all_days)*100 );
        } catch (Exception e) {
        	e.printStackTrace();
        }
	    return prog;
	}


	@RequestMapping(value = "/ProjectList" , method =  RequestMethod.GET)
	public ModelAndView project_list(ModelAndView mv , @RequestParam(value = "id")String id) {
		List<Project> list = projectService.getProjectList(id);
		List<Project> deadList = projectService.getDeadLineProjects(id);
		
		list.addAll(deadList); 
		for(Project p : list) {
			String d1 = p.getProject_start().substring(0, 10);
			String d2 = p.getProject_end().substring(0, 10);;
			
			int prog = getDayCount(d1,d2);
			if(prog > 100) {
				prog = 100;
				p.setProject_prog(prog);
				p.setProject_state("마감");
				p.setProject_priority("없음");
			} else {
				p.setProject_prog(prog);
			}
		}
		int listcount = projectService.getListCount();
		mv.addObject("listcount",listcount);
		mv.addObject("projectList", list);
		
		mv.setViewName("project/project_List");
		
		
		return mv;
	}
	
	@RequestMapping(value = "/ProjectAddProcess" , method =  RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv , Project project){
		System.out.println(project.getProject_name());
		System.out.println("프로젝트 모달 컨트롤러 들어옴");
		
		
		mv.setViewName("project/project_add_modal");
		return mv;
	}
	
	@RequestMapping(value = "projectDetailFeed", method = RequestMethod.GET)
	public ModelAndView projectDetailFeed(ModelAndView mv, @RequestParam(value = "id")String id,
			@RequestParam(value = "p_num")int p_num) {
		Logger.info("접속중인 ID : " + id);
		Logger.info("선택한 프로젝트 번호 : " + p_num);
		List<Project_Board> pb_list = projectService.getPojectBoardFeed(p_num);
		mv.addObject("pb",pb_list);
		
		mv.setViewName("project/project_Detail_Feed");
		
		return mv;
	}
}
	