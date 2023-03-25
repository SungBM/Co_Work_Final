package com.naver.cowork.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Member;
import com.naver.cowork.service.MemberService;

@Controller
@RequestMapping(value = "chat")
public class ChatController {
	
	private MemberService memberservice;
	
	@Autowired
	public ChatController(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	@GetMapping("")
	public String chat() {
		return "chat/chatForm";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView memberList(String user_id, ModelAndView mv, HttpServletRequest request) {
		
		Member m = memberservice.member_info(user_id);
		
		//List<UserInfo> list = userinfoservice.getSearchList(0, user_id, 0, 0)
		mv.setViewName("chat/chatForm");
		mv.addObject("userinfoservice", m);
		return mv;
	}

}