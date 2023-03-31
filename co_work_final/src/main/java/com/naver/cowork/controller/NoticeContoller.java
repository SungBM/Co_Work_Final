package com.naver.cowork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Notice;
import com.naver.cowork.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeContoller {

	private static final Logger logger = LoggerFactory.getLogger(NoticeContoller.class);

	private NoticeService noticeService;
	
	
	@Autowired
	public NoticeContoller(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

/*	@ResponseBody
	@RequestMapping(value = "/noticeList_ajax")
	public Map<String, Object> boardListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit
			) {
		int listcount = noticeService.getListCount(); // 총 리스트 수를 받아옴
		
		// 총 페이지 수
				int maxpage = (listcount + limit - 1) / limit;
				
				// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
				int startpage = ((page -1) / 10) * 10 + 1;
				
				// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
				int endpage = startpage + 10 - 1;
				
				if (endpage > maxpage)
					endpage = maxpage;
				
				List<Notice> noticelist = noticeService.getNoticeList(page, limit); // 리스트를 받아옴
				
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("page", page);
				map.put("maxpage", maxpage);
				map.put("startpage", startpage);
				map.put("endpage", endpage);
				map.put("listcount", listcount);
				map.put("noticelist", noticelist);
				map.put("limit", limit);
				return map;
			}
*/	
	@RequestMapping(value = "/noticeList", method=RequestMethod.GET)
	public ModelAndView noticeList(
									@RequestParam(value="page", defaultValue="1", required=false) int page, ModelAndView mv) {
		
	int limit = 10; // 한 화면에 출력할 로우 갯수
	
	int listcount = noticeService.getListCount(); // 총 리스트 수 받아옴
	
	// 총 페이지 수
	int maxpage = (listcount + limit -1) / limit;
	
	// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	int startpage = ((page -1) / 10) * 10 + 1;
	
	//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
	int endpage = startpage + 10 -1;
	
	if (endpage > maxpage)
		endpage = maxpage;
	
	List<Notice> noticelist = noticeService.getNoticeList(page, limit); //리스트 받아옴
	
	mv.setViewName("board/notice/list");
	mv.addObject("page", page);
	mv.addObject("maxpage", maxpage);
	mv.addObject("startpage", startpage);
	mv.addObject("endpage", endpage);
	mv.addObject("listcount", listcount);
	mv.addObject("noticelist", noticelist);
	mv.addObject("limit", limit);
	return mv;
	
	}
	
	//작성
	@GetMapping(value = "/write")///board/write
	//@RequestMapping(value="/write",method=RequestMethod.GET)
	public String board_write() {
		return "notice/write";
	}
}