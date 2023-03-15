package com.naver.cowork.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.logging.Logger;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@GetMapping("/ProjectList")
	public String project_list() {
		return "project/project_List";
	}
	
}
