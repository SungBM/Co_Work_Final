package com.naver.cowork.controller;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.service.NoticeService;

import java.util.logging.Logger;

@Controller
@RequestMapping("/notice")
public class NoticeContoller {
	private NoticeService noticeService;
	
	
	@Autowired
	public NoticeContoller(NoticeService noticeService) {
		this.noticeService = noticeService;
	}



	@GetMapping("/noticeList")
	public ModelAndView noticeList(ModelAndView mv) {
		
	//mv 객체 쓰는경우는 list / 상세보기 등 유지해야할 db베이스값을 가지고 화면에 표시할때 
    //RedirectAttributes 반환형 String : 게시글 작성 성공! 실패! 삭제성공! 수정완료! message 내용을 가지고 일회성으로  다시 기존화면 (리스트)이동할떄
    //db접속 순서는 컨트롤러 -> 서비스 -> 매퍼로(DAO) -> DB 
		
		
		return mv;
	}
}
