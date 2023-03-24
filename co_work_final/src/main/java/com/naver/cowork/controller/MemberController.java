package com.naver.cowork.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Member;
import com.naver.cowork.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService memberservice;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberservice = memberService;
	}

	@GetMapping("/mypage")
	public ModelAndView mypage(String user_id, ModelAndView mv, HttpServletRequest request) {
		logger.info("id = " + user_id);
		Member m = memberservice.member_info(user_id);

		mv.setViewName("mypage/mypage");
		mv.addObject("memberinfo", m);
		System.out.println("한글나오나");
		return mv;
	}

}
