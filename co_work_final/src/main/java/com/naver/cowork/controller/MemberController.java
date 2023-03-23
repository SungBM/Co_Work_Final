package com.naver.cowork.controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.cowork.domain.MailVO;
import com.naver.cowork.domain.Member;
import com.naver.cowork.service.MemberService;
import com.naver.cowork.task.SendMail;


@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService meberService;
	private PasswordEncoder passwordEncoder;
	private SendMail sendMail;
	
	@Autowired
	public MemberController(MemberService meberService,SendMail sendMail,PasswordEncoder passwordEncoder) {
		this.meberService = meberService;
		this.sendMail = sendMail;
		this.passwordEncoder = passwordEncoder;
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value = "remember-me", required = false) Cookie readCookie,
								HttpSession session, Principal userPrincipal) {
		mv.setViewName("/member/loginForm");
		
		return mv;
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/joinForm";
	}
	
	@RequestMapping(value = "/joinProcess")
	public String joinProcess(Member member, RedirectAttributes rattr, 
			Model model, HttpServletRequest request) {
		// 비밀번호 암호화 추가.
		String id = member.getUSER_ID();
		String email = member.getUSER_EMAIL();
		String name = member.getUSER_NAME();
		String encPassword = passwordEncoder.encode(member.getUSER_PASSWORD());
		String role = member.getUSER_IS_ADMIN();
	

		member.setUSER_PASSWORD(encPassword);

		int result = meberService.insert(member);

		// result=0; //에러페이지 확인용
				/*
				 * 스프링에서 제공하는 RedirectAttributes는 기존의 Servlet에서 사용되던 response.sendRedirect()를
				 * 사용할 때와 동일한 용도로 사용합니다. 리다이렉트로 전송하면 파라미터를 전달하고자 할 때 addAttribute()나
				 * addFlashAttribute()를 사용합니다. 예) response.sendRedirect("/test?result=1"); =>
				 * rattr.addAttribute("result", 1);
				 */
				// 삽입이 된 경우
		if (result == 1) {
			rattr.addFlashAttribute("result", "joinSuccess");
			return "redirect:login";
		} else {
			model.addAttribute("url", request.getRequestURI());
			model.addAttribute("message", "회원 가입 실패");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("USER_ID") String id, // member_joinForm에서 가져온 id값이 String형 id로 저장됨.
			HttpServletResponse response) throws Exception {
		int result = meberService.isId(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@GetMapping(value = "/sendMail" )
	public void sendMail(@RequestParam("USER_EMAIL")String receiver,HttpServletResponse response) 
			throws Exception {
		MailVO mail = new MailVO();
		mail.setTo(receiver);
		String num = sendMail.sendMail(mail);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(num);
	}
	
	
}
