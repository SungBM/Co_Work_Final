 package com.naver.cowork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
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
	
	@RequestMapping(value = "/ProjectAddProcess" , method =  RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv , Project project){
		System.out.println(project.getProject_name());
		System.out.println("프로젝트 모달 컨트롤러 들어옴");
		
		
		mv.setViewName("project/project_add_modal");
		return mv;
	}
	
	@RequestMapping(value = "/ProjectDetailList" , method =  RequestMethod.GET)
	public ModelAndView project_detail_list(ModelAndView mv) {
		
		List<Project_Board> detaillist = projectService.getProjectDetailList();
		mv.addObject("ProjectDetailList", detaillist);
		System.out.println(detaillist);
		System.out.println("프로젝트 디테일 리스트 들어옴");
		
			
		mv.setViewName("project/project_detail_List");
		
		return mv;
	}
	
	@GetMapping("/add")
	  public String showaddPage() {
	      return "project/add";
	}
	
	@PostMapping("/submit")
	public String submitPost(@RequestParam("title") String title,
	                         @RequestParam("content") String content,
	                         @RequestParam("filename") MultipartFile file) {

	    // 프로젝트 상세 페이지로 리다이렉트
	    return "redirect:/project/project_detail_List/";
	}
}
