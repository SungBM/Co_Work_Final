package com.naver.cowork.controller;



import com.naver.cowork.domain.MailVO;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.service.CalService;
import com.naver.cowork.service.MemberService;
//import com.naver.cowork.task.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/member")
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	private MemberService meberService;
	private CalService calservice;
	private PasswordEncoder passwordEncoder;
	//private SendMail sendMail;
	private MySaveFolder mysavefolder;

	@Autowired
	public CalendarController(MemberService meberService, //SendMail sendMail, PasswordEncoder passwordEncoder,
			MySaveFolder mysavefolder, CalService calservice) {
		this.meberService = meberService;
	//	this.sendMail = sendMail;
		this.passwordEncoder = passwordEncoder;
		this.mysavefolder = mysavefolder;
		this.calservice = calservice;
	}

	// Calendar 일정 파트
	@GetMapping("/calendar")
	public ModelAndView calendar(Principal principal, ModelAndView mv, com.naver.cowork.domain.Calendar calendar) {
		String user_id = principal.getName();
		List<com.naver.cowork.domain.Calendar> c = calservice.calAll(user_id);

		mv.setViewName("calendar/calendar");
		mv.addObject("callist", c);
		return mv;
	}

	// 일정 추가
	@PostMapping("/calAdd")
	public String calAdd(com.naver.cowork.domain.Calendar calendar, Principal principal) throws ParseException {
		String user_id = principal.getName();
		calservice.alldayCheck(calendar);  // 종일 체크 여부에 따른 입력값 수정
		calservice.typeCheck(calendar);
		calendar.setUser_id(user_id);
		calservice.calInsert(calendar);
		return "redirect:../member/calendar";
	}

	@GetMapping("/calUpdate")
	public String calChange(com.naver.cowork.domain.Calendar calendar, Principal principal) throws ParseException {
		String user_id = principal.getName();
		calendar.setUser_id(user_id);

		// end 날짜가 하루 뒤어야 일정바가 날짜에 맞춰짐
		String end_full_date = calendar.getCal_end_date() + " " + calendar.getCal_end_time();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = transFormat.parse(end_full_date);
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date); // 시간 설정
//            cal1.add(Calendar.DATE, 1); // 일 연산
		String strDate = transFormat.format(cal1.getTime());
		logger.info(strDate);

		calendar.setCal_end_date(strDate);

		calservice.calUpdate(calendar);
		return "redirect:../member/calendar";
	}

    @GetMapping("/calSelect")
    public void calSelect(@RequestParam List<String> cal_type, Principal principal, ModelAndView mv) {
        String user_id = principal.getName();
        List<com.naver.cowork.domain.Calendar> c = calservice.calSelectList(user_id, cal_type);

        logger.info(c.get(0).getCal_color());
        mv.addObject("callist", c);
    }


	@GetMapping("/calDelete")
	public void calDelete(int cal_no, HttpServletResponse response) throws IOException {
		int result = calservice.calDelete(cal_no);
		String valStr = "";
		if (result == 1) {
			valStr = "success";
		} else {
			valStr = "fail";
		}

		PrintWriter out = response.getWriter();
		out.print(valStr);
	}

}
