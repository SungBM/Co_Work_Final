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
	public ModelAndView memberList( ModelAndView mv, HttpServletRequest request) {
		
		List<Member> m = memberservice.members();
		
		mv.setViewName("chat/chatForm");
		mv.addObject("members", m);
		return mv;
	}
	
	
	
	//채팅창으로 이동
	@GetMapping("/chatting")
		public ModelAndView getChatting(ModelAndView mv, HttpServletRequest request) {
			mv.setViewName("chat/chatting");
			return mv;
		}

	
	
}
