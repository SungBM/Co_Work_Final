package com.naver.cowork.chat;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ChattController {
	
	@RequestMapping("/chat")
	public ModelAndView chatt() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatting");
		return mv;
	}

	
}