package com.naver.cowork.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.cowork.domain.FreeBoard;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.Notice;
import com.naver.cowork.service.CommentService;
import com.naver.cowork.service.FreeBoardService;

@Controller
@RequestMapping(value="freeBoard")
public class FreeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	private MySaveFolder mysavefolder;
	private FreeBoardService freeboardService;
	private CommentService commentService;
	
	@Autowired
	public FreeBoardController(MySaveFolder mysavefolder, FreeBoardService freeboardService, CommentService commentService) {
		this.mysavefolder=mysavefolder;
		this.freeboardService=freeboardService;
		this.commentService=commentService;
	}
	
	@ResponseBody
	@PostMapping(value = "/freeBoardList_ajax")
	public Map<String, Object> freeBoardListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit,
			@RequestParam(value="state",  required=false) String state
			) {
		int listcount = freeboardService.getFreeListCount(); // 총 리스트 수를 받아옴
		System.out.println(page);
		System.out.println(limit);
		// 총 페이지 수
				int maxpage = (listcount + limit - 1) / limit;
				
				// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
				int startpage = ((page -1) / 10) * 10 + 1;
				
				// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
				int endpage = startpage + 10 - 1;
				
				if (endpage > maxpage)
					endpage = maxpage;
				
				List<FreeBoard> freeboardlist = freeboardService.freeBoardList(page, limit); // 리스트를 받아옴
				
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("page", page);
				map.put("maxpage", maxpage);
				map.put("startpage", startpage);
				map.put("endpage", endpage);
				map.put("listcount", listcount);
				map.put("freeboardlist", freeboardlist);
				map.put("limit", limit);
				return map;
	}
	
	@RequestMapping(value="/freeBoardList", method=RequestMethod.GET)
	public ModelAndView freeBoardList(@RequestParam(value="page", defaultValue="1", required=false) int page,
									  ModelAndView mv) {
		int limit = 10;
		
		int listcount = freeboardService.getFreeListCount();
		
		int maxpage = (listcount + limit -1) / limit;
		
		int startpage = ((page -1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		List<FreeBoard> freeboardlist = freeboardService.freeBoardList(page, limit);
		
		mv.setViewName("freeBoard/freeBoardList");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("freeboardlist", freeboardlist);
		mv.addObject("limit", limit);
		return mv;
	}
	
	//글쓰기
	@RequestMapping(value="/freeWrite", method=RequestMethod.GET)
	public String freeBoard_write() {
		return "freeBoard/freeWrite";
	}
	
	//글 추가
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(FreeBoard freeboard, HttpServletRequest request)
		throws Exception{
			MultipartFile uploadfile = freeboard.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();
			freeboard.setFREEBOARD_ORIGINAL(fileName);
			
			String saveFolder = mysavefolder.getSavefolder();
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);
			
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			logger.info("transfeTo path = " + saveFolder + fileDBName);
			
			freeboard.setFREEBOARD_FILE(fileDBName);
		}
		
		freeboardService.insertFreeBoard(freeboard);
		logger.info(freeboard.toString());
		return "redirect:freeBoardList";
	}

	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);
		
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();
		}
		
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		int index = fileName.lastIndexOf(".");
		
		logger.info("index = " + index);
		
		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
		
		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	
	//상세보기
	@GetMapping("/detail")
	public ModelAndView Detail(int num, ModelAndView mv, HttpServletRequest request,
							   @RequestHeader(value="referer", required=false) String beforeURL) {
		
		//조회수
		logger.info("referer: " + beforeURL);
		if(beforeURL!=null && beforeURL.endsWith("freeBoardList")) {
			freeboardService.setReadCountUpdate(num);
		}
		
		FreeBoard freeboard = freeboardService.getDetail(num);
		if(freeboard == null) {
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패입니다.");
		}else {
			logger.info("상세보기 성공");
			int count = commentService.getFreeListCount(num);
			mv.setViewName("freeBoard/freeView");
			mv.addObject("count", count);
			mv.addObject("freeboarddata", freeboard);
		}
		return mv;
	}
	
	//수정
	@GetMapping("/freemodifyView")
	public ModelAndView FreeBoardModifyView(int num, ModelAndView mv, HttpServletRequest request) {
		FreeBoard freeboarddata = freeboardService.getDetail(num);
		
		if(freeboarddata == null) {
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "수정보기 실패입니다.");
			return mv;
		}
		logger.info("(수정)상세보기 성공");
		mv.addObject("freeboarddata", freeboarddata);
		mv.setViewName("freeBoard/freeBoardModify");
		return mv;
	}
	
	//수정액션
	@PostMapping("/freemodifyAction")
	public String freeModifyAction(FreeBoard freeboarddata, String check, Model mv,
									HttpServletRequest request, RedirectAttributes rattr)throws Exception{
		boolean usercheck = freeboardService.isFreeBoardWriter(freeboarddata.getFREEBOARD_NUM(), freeboarddata.getFREEBOARD_PASS());
		String url="";
		
		System.out.println(usercheck);
		
		if(usercheck == false) {
			rattr.addFlashAttribute("result", "passFail");
			rattr.addAttribute("num", freeboarddata.getFREEBOARD_NUM());
			return "redirect:freemodifyView";
		}
		
		MultipartFile uploadfile = freeboarddata.getUploadfile();
		
		if(check != null && !check.equals("")) {
			logger.info("기존파일 그대로 사용합니다.");
			freeboarddata.setFREEBOARD_ORIGINAL(check);
		}else {
			if(uploadfile != null && !uploadfile.isEmpty()) {
				logger.info("파일 추가/변경되었습니다.");
				
				String fileName = uploadfile.getOriginalFilename();
				freeboarddata.setFREEBOARD_ORIGINAL(fileName);
				
				String saveFolder = mysavefolder.getSavefolder();
				String fileDBName = fileDBName(fileName, saveFolder);
				logger.info("fileDBName = " + fileDBName);
				
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				logger.info("transferTo path = " + saveFolder + fileDBName);
				
				freeboarddata.setFREEBOARD_FILE(fileDBName);
			}else {
				logger.info("선택 파일 없습니다.");
				
				freeboarddata.setFREEBOARD_FILE("");
				freeboarddata.setFREEBOARD_ORIGINAL("");
			}
		}
		int result = freeboardService.freeBoardModify(freeboarddata);
		
		if(result == 0) {
			logger.info("게시판 수정 실패");
			mv.addAttribute("url", request.getRequestURI());
			mv.addAttribute("message", "게시판 수정 실패");
			url="error/error";
		}else {
			logger.info("게시판 수정 완료");
			url = "redirect:detail";
			rattr.addAttribute("num", freeboarddata.getFREEBOARD_NUM());
		}
		return url;
	}
	
	@GetMapping("/freeReplyView")
	public ModelAndView freeReplyView(int num, ModelAndView mv, HttpServletRequest request) {
		FreeBoard freeboard = freeboardService.getDetail(num);
		if(freeboard == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "게시판 답변글 가져오기 실패");
		}else {
			mv.addObject("freeboarddata", freeboard);
			mv.setViewName("freeBoard/freeReply");
		}
		return mv;
	}
	
	@PostMapping("/freereplyAction")
	public ModelAndView freeBoardReplyAction(FreeBoard freeboard, ModelAndView mv, 
						HttpServletRequest request, RedirectAttributes rattr) {
		int result = freeboardService.freeBoardReply(freeboard);
		if(result == 0) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "게시판 답변 처리실패");
		}else {
			rattr.addAttribute("num", freeboard.getFREEBOARD_NUM());
			mv.setViewName("redirect:detail");
		}
		return mv;
	}
	
	
	@PostMapping("/freeDelete")
	public String freeBoardDeleteAction(String FREEBOARD_PASS, int num, Model mv,
			RedirectAttributes rattr, HttpServletRequest request) {
		boolean usercheck = freeboardService.isFreeBoardWriter(num, FREEBOARD_PASS);
		
		if(usercheck == false) {
			rattr.addFlashAttribute("result", "passFail");
			rattr.addAttribute("num", num);
			return "redirect:detail";
		}
		System.out.print("result");
		int result = freeboardService.freeBoardDelete(num);
		System.out.print("result " + result);
		
		if(result == 0) {
			logger.info("게시판 삭제 실패");
			mv.addAttribute("url", request.getRequestURI());
			mv.addAttribute("message", "삭제 실패");
			return "error/error";
		}
		
		logger.info("게시판 삭제 성공");;
		rattr.addFlashAttribute("result", "deleteSuccess");
		return "redirect:freeBoardList";
	}
	
	@ResponseBody
	@PostMapping("/down")
	public byte[] freeBoardFileDown(String filename, HttpServletRequest request, String original, HttpServletResponse response) throws Exception{
		String saveFolder = mysavefolder.getSavefolder();
		String sFilePath = saveFolder + filename;
		
		File file= new File(sFilePath);
		
		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
		String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		
		response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding);
		
		response.setContentLength(bytes.length);
		return bytes;
	}
}
