package com.naver.cowork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@GetMapping("/ProjectList")
	public String project_list() {
		return "project/project_List";
	}
	
}
