package com.naver.cowork.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.domain.Member;
import com.naver.cowork.service.ChatService;
import com.naver.cowork.service.MemberService;

@Controller
@RequestMapping(value = "chat")
public class ChatController {
	
	private MemberService memberservice;
	private ChatService chatservice;
	
	@Autowired
	public ChatController(MemberService memberservice, ChatService chatservice) {
		this.memberservice = memberservice;
		this.chatservice = chatservice;
	}
	
	@Autowired
	ChatService service;
	
	
	@GetMapping("")
	public ModelAndView memberList( ModelAndView mv, HttpServletRequest request,@RequestParam(value = "id")String id) {
		
		List<Member> m = memberservice.members();
		mv.setViewName("chat/chatForm");
		mv.addObject("loginid",id);
		mv.addObject("members", m);
		return mv;
	}
	
	
	
	//채팅창으로 이동
	@GetMapping("/chatting")
		public ModelAndView getChatting(ModelAndView mv, String user_name) {
			mv.addObject("user_name", user_name);
			mv.setViewName("chat/chatting");
			return mv;
		}
	
	@PostMapping("/chat/list")
		public ModelAndView chatList() {
		List<ChatVO> chatList = chatservice.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("chatList", chatList);
		mv.setViewName("/chatting");
		return mv;
	}	
}
