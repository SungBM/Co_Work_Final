package com.naver.cowork.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.Notice;
import com.naver.cowork.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeContoller {

	private static final Logger logger = LoggerFactory.getLogger(NoticeContoller.class);

	private MySaveFolder mysavefolder;
	private NoticeService noticeService;
	
	@Autowired
	public NoticeContoller(NoticeService noticeService,
						   MySaveFolder mysavefolder) {
		this.noticeService = noticeService;
		this.mysavefolder = mysavefolder;
	}

	@ResponseBody
	@RequestMapping(value = "/noticeList_ajax")
	public Map<String, Object> noticeListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit,
			@RequestParam(value="search_field", defaultValue="0", required=false) int index, //search_field를 가져와서 index이름으로 사용할것
			@RequestParam(value="search_word", defaultValue="", required=false) String search_word
			) {
		int listcount = noticeService.getListCount(index, search_word); // 총 리스트 수를 받아옴
		
		// 총 페이지 수
				int maxpage = (listcount + limit - 1) / limit;
				
				// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
				int startpage = ((page -1) / 10) * 10 + 1;
				
				// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
				int endpage = startpage + 10 - 1;
				
				if (endpage > maxpage)
					endpage = maxpage;
				
				List<Notice> noticelist = noticeService.getNoticeList(index, search_word, page, limit); // 리스트를 받아옴
				
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("search_field", index);
				map.put("search_word", search_word);
				map.put("page", page);
				map.put("maxpage", maxpage);
				map.put("startpage", startpage);
				map.put("endpage", endpage);
				map.put("listcount", listcount);
				map.put("noticelist", noticelist);
				map.put("limit", limit);
				
				if (page > 1) {
					map.put("firstPage", 1);
			    }
				
				if (page < maxpage) {
					map.put("lastPage", maxpage);
			    }
				return map;
			}
	
	@RequestMapping(value = "/noticeList", method=RequestMethod.GET)
	public ModelAndView noticeList(
									@RequestParam(value="page", defaultValue="1", required=false) int page,
									ModelAndView mv,
									@RequestParam(value="search_field", defaultValue="0", required=false) int index, //search_field를 가져와서 index이름으로 사용할것
									@RequestParam(value="search_word", defaultValue="", required=false) String search_word
									) {
		
	int limit = 10; // 한 화면에 출력할 로우 갯수
	
	int listcount = noticeService.getListCount(index, search_word); // 총 리스트 수 받아옴

	// 총 페이지 수
	int maxpage = (listcount + limit -1) / limit;
	
	// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	int startpage = ((page -1) / 10) * 10 + 1;
	
	//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
	int endpage = startpage + 10 -1;
	
	if (endpage > maxpage)
		endpage = maxpage;
	
	List<Notice> noticelist = noticeService.getNoticeList(index, search_word, page, limit); //리스트 받아옴
	
	mv.setViewName("board/notice/list");
	mv.addObject("page", page);
	mv.addObject("maxpage", maxpage);
	mv.addObject("startpage", startpage);
	mv.addObject("endpage", endpage);
	mv.addObject("listcount", listcount);
	mv.addObject("noticelist", noticelist);
	mv.addObject("limit", limit);
	mv.addObject("search_field", index);
	mv.addObject("search_word", search_word);
	
	if (startpage > 1) {
        mv.addObject("firstPage", 1);
    }
	
	if (endpage < maxpage) {
        mv.addObject("lastPage", maxpage);
    }
	
	return mv;
	
	}
	
	//작성페이지
	@GetMapping(value = "/noticeWrite")///board/write
	//@RequestMapping(value="/noticeWrite",method=RequestMethod.GET)
	public String notice_write() {
		return "board/notice/write";
	}
	
	//추가
	@PostMapping("/add")
	public String add(Notice notice, HttpServletRequest request)
			throws Exception {
			
			MultipartFile uploadfile = notice.getUploadfile();
			
			if(!uploadfile.isEmpty()) {
				String fileName = uploadfile.getOriginalFilename();//원래 파일명
				notice.setNOTICE_ORIGINAL(fileName);//원래 파일명 저장
				
				String saveFolder = mysavefolder.getSavefolder();
				String fileDBName = fileDBName(fileName, saveFolder);
				logger.info("fileDBName = " + fileDBName);
				
				// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				logger.info("transferTo path = " + saveFolder + fileDBName);
				// 바뀐 파일명으로 저장
				notice.setNOTICE_FILE(fileDBName);
			}
			
			noticeService.insertNotice(notice); // 저장메서드 호출
			logger.info(notice.toString());//selectKey로 정의한 NOTICE_NUM 값 확인해 봅니다.
			return "redirect:noticeList";
		}
	
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH); //오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
		
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();//새로운 폴더를 생성
		}
		
		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
		logger.info("index = " + index);
		
		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		
		//새로운 파일명
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
		
		// 오라클 디비에 저장될 파일 명
		//String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}

	
	@GetMapping("/detail")
	public ModelAndView Detail(
			int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer:" + beforeURL);
		if(beforeURL!=null && beforeURL.endsWith("noticeList")) {
			noticeService.setReadCountUpdate(num);
		}

		Notice notice = noticeService.getNoticeDetail(num);
		//board=null; 	//error 페이지 이동 확인하고자 임의로 지정합니다.
		if (notice == null) {
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			logger.info("상세보기 성공");
			mv.setViewName("board/notice/view");
			mv.addObject("noticedata", notice);
		}
		
		return mv;
	}
	
	@GetMapping("/modifyView")  //앵커태그를 사용했으면 get방식임.
	public ModelAndView modifyView(int num, ModelAndView mv, HttpServletRequest request) {
		Notice noticedata = noticeService.getNoticeDetail(num);
		
		
		
		//글 내용 불러오기 실패한 경우입니다.
		if(noticedata == null) {
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "수정보기 실패입니다.");
			return mv;
		}
		logger.info("(수정)상세보기 성공");
		//수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boarddata 객체를
		//ModelAndView 객체에 저장합니다.
		mv.addObject("noticedata", noticedata);
		//글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
		mv.setViewName("board/notice/modify");
		return mv;
	}
	
	@PostMapping("/modifyAction")
	public String ModifyAction(Notice noticedata, String check, Model mv,
					HttpServletRequest request, RedirectAttributes rattr)
				throws Exception{
		
		String url = "";
		MultipartFile uploadfile = noticedata.getUploadfile();
		//String saveFolder = request.getSession().getServletContext().getRealPath("resources")
		//					+ "/upload";
		
		if(check != null && !check.equals("")) { //기존파일 그대로 사용하는 경우입니다.
			logger.info("기존 파일 그대로 사용합니다.");
			noticedata.setNOTICE_ORIGINAL(check);
			//<input type="hidden" name="NOTICE_FILE" value="${noticedata.NOTICE_FILE}">
			//위의 문장 때문에 notice.setNOTICE_FILE()값은 자동 저장됩니다.
		}else {
			//답변글의 경우 파일 첨부에 대한 기능이 없습니다.
			//만약 답변글을 수정할 경우
			//<input type="file" id="upfile" name="uploadfile" >엘리먼트가 존재하지 않아
			//private MultipartFile uploadfile;에서 uploadfile은 null입니다.
			if(uploadfile!=null && !uploadfile.isEmpty()) {
				logger.info("파일추가/변경되었습니다.");
				
				String fileName=uploadfile.getOriginalFilename(); //원래 파일 명
				noticedata.setNOTICE_ORIGINAL(fileName);

				String saveFolder = mysavefolder.getSavefolder();
				String fileDBName = fileDBName(fileName, saveFolder);
				logger.info("fileDBName = " + fileDBName);
				//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				logger.info("transferTo path = " + saveFolder + fileDBName);
				//바뀐 파일명으로 저장
				noticedata.setNOTICE_FILE(fileDBName);
			}else { //기존 파일 없는데 파일 선택하지 않은 경우 또는 기존 파일이 있었는데 삭제한 경우
				logger.info("선택 파일 없습니다.");
				//<input type="hidden" name="NOTICE_FILE" value="${noticedata.NOTICE_FILE}">
				//위 태그에 값이 있다면 ""로 값을 변경합니다.
				noticedata.setNOTICE_FILE(""); //""로 초기화 합니다.
				noticedata.setNOTICE_ORIGINAL(""); //""로 초기화 합니다.
			}  //else end
		}//else end
		
		//DAO에서 수정 메서드 호출하여 수정합니다.
		int result = noticeService.noticeModify(noticedata);
		//수정 실패한 경우
		if(result == 0) {
			logger.info("게시판 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "게시판 수정 실패");
			url = "error/error";
		}else {
			logger.info("게시판 수정 완료");
			//수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기 위해 경로를 설정합니다.
			url = "redirect:detail";
			rattr.addAttribute("num", noticedata.getNOTICE_NUM());
		}
		return url;	//url = "error/error"; or url = "redirect:detail"; 리턴
	}
	
	@PostMapping("/delete")
	public String NoticeDeleteAction(int num,
									Model mv, RedirectAttributes rattr,
									HttpServletRequest request
			) {
		
		//비밀번호 일치하는 경우 삭제 처리합니다.
		int result = noticeService.noticeDelete(num);
		
		// 삭제 처리 실패한 경우
		if (result == 0) {
			logger.info("게시판 삭제 실패");
			mv.addAttribute("url", request.getRequestURI());
			mv.addAttribute("message", "삭제 실패");
			return "error/error";
		}
		
		// 삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
		logger.info("게시판 삭제 성공");
		rattr.addFlashAttribute("result", "deleteSuccess");
		return "redirect:noticeList";
	}
	
	@ResponseBody
	@PostMapping("/down")
	public byte[] NoticeFileDown(String filename,
								HttpServletRequest request,
								String original,
								HttpServletResponse response) throws Exception {
		//String savePath = "resources/upload";
		// 서블릿의 실행 환경 정보를 담고 있는 객체를 리턴합니다.
		//ServletContext context = request.getSession().getServletContext();
		//String sDownloadPath = context.getRealPath(savePath);
		
		String saveFolder = mysavefolder.getSavefolder();
		String sFilePath = saveFolder + filename;
		
		File file = new File(sFilePath);
		
		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
		String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		
		//Content-Disponsition: attachment: 브라우저는 해당 Content를 처리하지 않고, 다운로드하게 됩니다.
		response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding );
		
		response.setContentLength(bytes.length);
		return bytes;
	}
	
}