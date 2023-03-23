 package com.naver.cowork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Project;
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



	@RequestMapping(value = "/ProjectList" , method =  RequestMethod.GET)
	public ModelAndView project_list(ModelAndView mv , @RequestParam(value = "id")String id) {
		System.out.println(id);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("id", id);
//		map.put("password", "1234");
		
		List<Project> list = projectService.getProjectList(id);
		mv.addObject("projectList", list);
		System.out.println(list);
		System.out.println("프로젝트컨트롤러들어옴");
		
			
		mv.setViewName("project/project_List");
		
		return mv;
	}
	
	@RequestMapping(value = "/ProjectAddProcess" , method =  RequestMethod.POST)
	public ModelAndView insert(ModelAndView mv , @RequestParam(value = "project") {
		Project p = new Project();
		
		p.setProject_name("프로젝트1");
		p.setProject_state("진행중");
		p.setProject_admin("HTA1");
		p.setProject_start("2023-03-23");
		p.setProject_end("2023-03-23");
		p.setProject_priority("HTA1");
		
		System.out.println("프로젝트 모달 컨트롤러 들어옴");
		mv.setViewName("project/project_add_modal");
		return mv;
	}
}
	

