package com.naver.cowork.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.UserInfo;
import com.naver.cowork.service.UserInfoService;

@Controller
public class ChattController {
	
	@GetMapping("/chat")
	public String chat() {
		return "chat/chatForm";
	}
	
	@RequestMapping(value="/list")
	public ModelAndView memberList(@RequestParam(value = "search_word", defaultValue = "", required = false) ModelAndView mv, String search_word) {

		int listcount = userInfoservice.getSearchListCount(search_word);

		List<UserInfo> list = userInfoservice.getSearchList(search_word); 

		mv.setViewName("chat/chatForm");
		mv.addObject("memberlist", list);
		mv.addObject("search_word", search_word);
		return mv;
	}

}