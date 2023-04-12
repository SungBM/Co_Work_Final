 package com.naver.cowork.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.Proboard_check_user;
import com.naver.cowork.domain.Project;
import com.naver.cowork.domain.Project_Board;
import com.naver.cowork.domain.Project_Board_Comment;
import com.naver.cowork.service.FileUtil;
import com.naver.cowork.service.PJPriorityEnum;
import com.naver.cowork.service.PJStateEnum;
import com.naver.cowork.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger Logger = LoggerFactory.getLogger(ProjectController.class);
	
	private ProjectService projectService;
	private MySaveFolder mysavefolder;
	@Autowired
	public ProjectController(ProjectService projectService,MySaveFolder mysavefolder) {
		super();
		this.projectService = projectService;
		this.mysavefolder = mysavefolder;
	}

	public int getDayCount(String startDate, String endDate) {
		int prog = 0;
		
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        try {
        	Date startFormat =  sdf.parse(startDate);
    	    Date endFormat =  sdf.parse(endDate);
    	    Date todayformat = sdf.parse(strToday);
    	    long diffSec = (endFormat.getTime() - startFormat.getTime()) / 1000; //초 차이
    	    long diffMin = (endFormat.getTime() - startFormat.getTime()) / 60000; //분 차이
    	    long diffHor = (endFormat.getTime() - startFormat.getTime()) / 3600000; //시 차이
    	    long all_Days_diff = diffSec / (24*60*60); //일자수 차이
    	   
    	    long today_diff_sec = (endFormat
    	    		.getTime() - todayformat.getTime()) / 1000;
    	    long today_diff = today_diff_sec / (24*60*60);
    			        		
    	    double all_days = all_Days_diff;
    	    double today =  today_diff;
    	    prog = 100-(int)((today / all_days)*100 );
        } catch (Exception e) {
        	e.printStackTrace();
        }
	    return prog;
	}


	@RequestMapping(value = "/ProjectList" , method =  RequestMethod.GET)
	public ModelAndView project_list(ModelAndView mv , @RequestParam(value = "id")String id) {
		List<Project> list = projectService.getProjectList(id);
		List<Project> deadList = projectService.getDeadLineProjects(id);
		
		list.addAll(deadList); 
		for(Project p : list) {
			String d1 = p.getProject_start().substring(0, 10);
			String d2 = p.getProject_end().substring(0, 10);;
			
			int prog = getDayCount(d1,d2);
			if(prog > 100) {
				prog = 100;
				p.setProject_prog(prog);
				p.setProject_state(PJStateEnum.OVERDEADLINE.getState());
				p.setProject_priority(PJPriorityEnum.NONEPRIORITY.getPriority());
			} else {
				p.setProject_prog(prog);
			}
		}
		int listcount = projectService.getListCount();
		mv.addObject("listcount",listcount);
		mv.addObject("projectList", list);
		
		mv.setViewName("project/project_List");
		
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "/ProjectAddProcess" , method =  RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv , Project project){
		
		
		mv.setViewName("project/project_add_modal");
		return mv;
	}
	

	@RequestMapping(value = "/ProjectDetailList" , method =  RequestMethod.GET)
	public ModelAndView project_detail_list(ModelAndView mv) {
		
		List<Project_Board> detaillist = projectService.getProjectDetailList();
		mv.addObject("ProjectDetailList", detaillist);
		
			
		mv.setViewName("project/project_detail_List");
		
		return mv;
	}
	
	@GetMapping("/add")
	  public String showaddPage() {
	      return "project/add";
	}
	
	@PostMapping("/submit")
	public String submitPost(@RequestParam("title") String title,
	                         @RequestParam("content") String content,
	                         @RequestParam("filename") MultipartFile file) {

	    // 프로젝트 상세 페이지로 리다이렉트
	    return "redirect:/project/project_detail_List/";
  }

	@RequestMapping(value = "projectDetailFeed", method = RequestMethod.GET)
	public ModelAndView projectDetailFeed(ModelAndView mv, @RequestParam(value = "id")String id,
			@RequestParam(value = "pNum")int pNum) {
		Logger.info("접속중인 ID : " + id);
		Logger.info("선택한 프로젝트 번호 : " + pNum);
		List<Project_Board> pb_list = projectService.getPojectBoardFeed(pNum);
		String project_Name = projectService.getProjectName(pNum);
		String [] bmBoard = projectService.getProjectBookmarkList(pNum);
		List<Proboard_check_user> pcu = projectService.getProBoardCheckUserList(id);
		
		for(Project_Board pb : pb_list ) {
			pb.setPROBOARD_CHECK_USERS(pcu);
			
		}
		
		mv.addObject("pblist",pb_list);
		mv.addObject("projectName",project_Name);
		mv.addObject("id",id);
		mv.addObject("bmBoard",bmBoard);
		mv.setViewName("project/project_Detail_Feed");
		
		return mv;
	}
	
	
	
	
	@ResponseBody
	@PostMapping("/projectFileDown")
	public byte[] BoardFileDown(String filename,
								HttpServletRequest request,
								String original,
								HttpServletResponse response) throws Exception {
		
		String saveFolder = mysavefolder.getSavefolder();
		String sFilePath = saveFolder + filename;
		
		File file = new File(sFilePath);
		
		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
		String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		
		response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding );
		
		response.setContentLength(bytes.length);
		return bytes;
	}
	
	@RequestMapping(value = "/ProjectLikeIncrease" , method = RequestMethod.GET)
	public void ProjectLikeIncrease(@RequestParam("pbNum")int pbNum,@RequestParam("id")String id, HttpServletResponse response) throws Exception {
		int result = projectService.increaseCheck(pbNum,id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value = "/ProjectLikeDecrease", method = RequestMethod.GET)
	public void ProjectLikeDecrease(@RequestParam("pbNum")int pbNum,@RequestParam("id")String id, HttpServletResponse response) throws Exception {
		int result = projectService.decreaseCheck(pbNum,id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);

	}
	
	@RequestMapping(value = "/ProjectBookmarkCheckedClear" , method = RequestMethod.GET)
	public void ProjectBookmarkCheckedClear(@RequestParam("pbNum")int pbNum, HttpServletResponse response) throws Exception {
		String resultSubject = projectService.ProjectBookmarkCheckedClear(pbNum);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(resultSubject);
	}
	
	@RequestMapping(value = "/ProjectBookmarkChecked" , method = RequestMethod.GET)
	public void ProjectBookmarkChecked(@RequestParam("pbNum")int pbNum, HttpServletResponse response) throws Exception{
		String resultSubject = projectService.ProjectBookmarkChecked(pbNum);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(resultSubject);
	}
	
	@RequestMapping(value = "/ProjectCommentAdd" , method = RequestMethod.POST)
	@ResponseBody
	public List<Project_Board_Comment>  ProjectCommentAdd(Project_Board_Comment pbc,@RequestParam(value = "page" , defaultValue = "1", required = false )int page,HttpServletResponse response) throws Exception {
		MultipartFile commentFile = pbc.getFileNames();
	       if (!commentFile.isEmpty()) {
	    	   FileUtil.fileUpload(commentFile, pbc, mysavefolder);
	            
	        }
	       
	    int result = projectService.ProjectCommentAdd(pbc);
	    int pbNum = pbc.getPRO_BOARD_NUM();
	    List<Project_Board_Comment> commentList = projectService.getProjectCommentList(pbNum,page);
	    
		return commentList;
	}
	
	@RequestMapping(value = "/getPjectCommentList" , method = RequestMethod.POST)
	@ResponseBody
	public List<Project_Board_Comment>getPjectCommentList(int pbNum,@RequestParam(value = "page" , defaultValue = "1", required = false )int page,HttpServletResponse response) throws Exception {
		List<Project_Board_Comment> commentList = null;
		commentList = projectService.getProjectCommentList(pbNum,page);
		
		return commentList;
	}
	
	@GetMapping(value = "/getPjectCommentCount")
	public void getPjectCommentCount(int pbNum,HttpServletResponse response) throws Exception {
		int count = projectService.getPjectCommentCount(pbNum);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(count);
	}
	
	@GetMapping(value = "/commentDelete")
	@ResponseBody
	public List<Project_Board_Comment>commentDelete(int pbcNum, int pbNum,@RequestParam(value = "page" , defaultValue = "1", required = false )int page, HttpServletResponse response) throws Exception{
		int result = projectService.commentDelete(pbcNum);
		List<Project_Board_Comment> commentList = projectService.getProjectCommentList(pbNum,page);
		return commentList;
	}
	
	@PostMapping(value = "/ProjectCommentUpdate")
	@ResponseBody
	public List<Project_Board_Comment>ProjectCommentUpdate(Project_Board_Comment pbc,@RequestParam(value = "page" , defaultValue = "1", required = false )int page,HttpServletResponse response) throws Exception {
		
		MultipartFile commentFile = pbc.getFileNames();
	       if (!commentFile.isEmpty()) {
	    	   FileUtil.fileUpload(commentFile, pbc, mysavefolder);
	            
	        }
	       
	    int result = projectService.ProjectCommentUpdate(pbc);
	    int pbNum = pbc.getPRO_BOARD_NUM();
	    List<Project_Board_Comment> commentList = projectService.getProjectCommentList(pbNum,page);
	    
	    
		return commentList;
	}
	
	@PostMapping(value = "/ProjectCommentReply")
	@ResponseBody
	public List<Project_Board_Comment>ProjectCommentReply(Project_Board_Comment pbc,@RequestParam(value = "page" , defaultValue = "1", required = false )int page,HttpServletResponse response) throws Exception {
		
		MultipartFile commentFile = pbc.getFileNames();
		if (!commentFile.isEmpty()) {
			FileUtil.fileUpload(commentFile, pbc, mysavefolder);
			
		}
		pbc.setPRO_BO_COMMENT_RE_REF(pbc.getPRO_BO_COMMENT_NUM());
		
		int result = projectService.ProjectCommentReply(pbc);
		int pbNum = pbc.getPRO_BOARD_NUM();
		List<Project_Board_Comment> commentList = projectService.getProjectCommentList(pbNum,page);
		
		for( Project_Board_Comment pbc2 : commentList) {
			String content = pbc2.getPRO_BO_COMMENT_CONTENT();
		}
		
		return commentList;
	}
}
