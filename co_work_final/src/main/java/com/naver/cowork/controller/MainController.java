package com.naver.cowork.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.logging.Logger;

@Controller
@RequestMapping("/member")
public class MainController {
	
	@GetMapping("/login")
	public String login() {
		return "member/loginForm";
	}
	
	@GetMapping("/main")
	public String main() {
		return "member/main";
	}
	
	
}