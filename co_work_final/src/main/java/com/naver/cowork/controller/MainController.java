package com.naver.cowork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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