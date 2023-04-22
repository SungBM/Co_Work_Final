package com.naver.cowork.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.domain.Member;
import com.naver.cowork.service.ChatService;
import com.naver.cowork.service.DeptService;
import com.naver.cowork.service.MemberService;


@Controller
@RequestMapping(value = "chat")
public class ChatMainController {
	
	
	  private MemberService memberservice;
	  private ChatService chatservice;
//	  private DeptService deptservice;
	  private ChatService service;
	  
	  
	  @Autowired 
	  public ChatMainController(MemberService memberservice, ChatService chatservice, DeptService deptservice, ChatService service) {
	  this.memberservice = memberservice; 
	  this.chatservice = chatservice;
//	  this.deptservice = deptservice;
	  this.service = service;
	  }
	  
//	  @Autowired
//		ChatService service;

	
	@GetMapping("/chatForm")
	public ModelAndView memberList( ModelAndView mv, HttpServletRequest request, Principal principal) {
		
		List<Map<String, Object>> m = service.deptNames();
		String user_id = principal.getName();
		String userimg = memberservice.user_img(user_id);
//		String deptName = deptservice.deptName(user_id);
		mv.setViewName("chat/chatForm");
		mv.addObject("loginid",principal.getName());
		mv.addObject("deptNames", m);
//		mv.addObject("deptName", deptName);
		mv.addObject("userimg", userimg);
		System.out.print("loginid"+principal.getName());
		return mv;
	}
	
	
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
	   
	   
	   //DB 저장
	   @ResponseBody
	   @PostMapping("/chatSave")
	   public int saveChat(int roomNumber, String chat_sender, String chat_content) {
		   return chatservice.chatSave(roomNumber, chat_sender, chat_content);
	   }
	   
	   
	   //대화 리스트 가져오기
	   @ResponseBody
	   @PostMapping("/getList")
	   public List<ChatVO> getList(int roomNumber) {
		   return chatservice.getList(roomNumber);
	   }
	   
	   
	   //검색
//	   @ResponseBody
//	   @GetMapping("/searchList")
//	   public List<Map<String, Object>> searchList(String searchword){
//		   return memberservice.searchList(searchword);
//	   }
	   
}