package com.naver.cowork.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Member;
import com.naver.cowork.service.ChatService;
import com.naver.cowork.service.MemberService;


@Controller
@RequestMapping(value = "chat")
public class ChatMainController {
	
	
	  private MemberService memberservice;
	  private ChatService chatservice;
	  
	  
	  @Autowired 
	  public ChatMainController(MemberService memberservice, ChatService chatservice) {
	  this.memberservice = memberservice; 
	  this.chatservice = chatservice;
	  }
	  
	  @Autowired
		ChatService service;
	 
	/*
	 * List<Room> roomList = new ArrayList<Room>(); static int roomNumber = 0;
	 */
//	
//	@RequestMapping("/chatForm")
//	public ModelAndView chat() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("chat/chatForm");
//		return mv;
//	}
	
	
	@GetMapping("/chatForm")
	public ModelAndView memberList( ModelAndView mv, HttpServletRequest request, Principal principal) {
		
		List<Member> m = memberservice.members();
		mv.setViewName("chat/chatForm");
		mv.addObject("loginid",principal.getName());
		mv.addObject("members", m);
		System.out.print("loginid"+principal.getName());
		return mv;
	}
	
//	//채팅창으로 이동
//	@ResponseBody
//	@GetMapping("/chatting")
//		public ModelAndView getChatting(ModelAndView mv, String user_name) {
//			mv.addObject("user_name", user_name);
//			mv.setViewName("chat/chatting");
//			System.out.print("chatting");
//			return mv;
//		}
	

	
	//채팅방 있는지 확인하기 
	   @ResponseBody
	   @GetMapping("/getRoom")
	   public int getRoom(ModelAndView mv, Principal principal, String yourid) {
	      return chatservice.getRoom(principal.getName(), yourid);
	   }
	   
	   
	   
	//채팅방 만들기
	   @ResponseBody
	   @PostMapping("/createRoom")
	   public int createRoom(Principal principal, String yourid) {
		   return chatservice.createRoom(principal.getName(), yourid);
	   }
}