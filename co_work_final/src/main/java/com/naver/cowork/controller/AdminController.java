package com.naver.cowork.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Company;
import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Job;
import com.naver.cowork.domain.MeetingRoom;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.domain.PageDto;
import com.naver.cowork.service.CompanyService;
import com.naver.cowork.service.DeptService;
import com.naver.cowork.service.JobService;
import com.naver.cowork.service.MeetingRoomService;
import com.naver.cowork.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private MemberService memberservice;
	private DeptService deptservice;
	private JobService jobservice;
	private CompanyService companyservice;
	private MySaveFolder mysavefolder;
	private MeetingRoomService meetservice;

	@Autowired
	public AdminController(MemberService memberService, DeptService deptservice, JobService jobservice,
			MySaveFolder mysavefolder, CompanyService companyservice, MeetingRoomService meetservice) {
		this.memberservice = memberService;
		this.deptservice = deptservice;
		this.jobservice = jobservice;
		this.mysavefolder = mysavefolder;
		this.companyservice = companyservice;
		this.meetservice = meetservice;
	}

	@GetMapping("/members")
	public ModelAndView members(ModelAndView mv, Member member, Criteria cri) {
		List<Member> m = memberservice.members(cri);
		int total = memberservice.getCount();
		PageDto pageMaker = new PageDto(cri, total);

		List<Dept> d = deptservice.deptList();
		List<Job> j = jobservice.jobList();
		for (Member c : m) {
			String deptName = deptservice.deptName(c.getUser_id());
			String jobName = jobservice.jobName(c.getUser_id());
			c.setDept_name(deptName);
			c.setJob_name(jobName);
		}

		mv.setViewName("admin/members/membersinfo");
		mv.addObject("list", m);
		mv.addObject("deptList", d);
		mv.addObject("jobList", j);
		mv.addObject("pageMaker", pageMaker);
		return mv;
	}

	@GetMapping("/company")
	public ModelAndView company(ModelAndView mv) {
		List<Dept> d = deptservice.deptAll();
		List<Job> j = jobservice.jobAll();
		int dmaxNo = deptservice.dmaxNo();
		int jmaxNo = jobservice.jmaxNo();
		String comLogo = companyservice.companySelect();

		mv.setViewName("admin/company/companyinfo");
		mv.addObject("dept", d);
		mv.addObject("job", j);
		mv.addObject("dmaxno", dmaxNo);
		mv.addObject("jmaxno", jmaxNo);
		mv.addObject("comLogo", comLogo);
		return mv;
	}

	@PostMapping("/deptadd")
	public ModelAndView deptadd(ModelAndView mv, Dept dept) {
		deptservice.insert(dept);
		mv.setViewName("redirect:company");
		return mv;
	}

	@PostMapping("deleteDept")
	public String deleteDept(@RequestParam List<Integer> dept_no, Dept dept) {
		for (Integer c : dept_no) {
			dept.setDept_no(c);
			deptservice.delete(dept.getDept_no());
		}
		return "redirect:/admin/company";
	}

	@PostMapping("/jobadd")
	public ModelAndView jobadd(ModelAndView mv, Job job) {
		jobservice.insert(job);
		mv.setViewName("redirect:company");
		return mv;
	}

	@PostMapping("deleteJob")
	public String deleteJob(@RequestParam List<Integer> job_no) {

		for (Integer c : job_no) {
			Job job = new Job();
			job.setJob_no(c);
			jobservice.delete(job.getJob_no());
		}
		return "redirect:/admin/company";
	}

	@PostMapping("/memUpdate")
	public String memUpdate(Member member) {
		memberservice.adminUpdate(member);
		return "redirect:../admin/members";
	}

	@GetMapping("/authUpdate")
	public void authUpdate(String user_auth, String user_id) {
		memberservice.authUpdate(user_id, user_auth);
	}

	@GetMapping("/stateUpdate")
	public void stateUpdate(String user_auth, String user_state, String user_id) {
		memberservice.stateUpdate(user_id, user_auth, user_state);

	}

	@PostMapping("/companyUpdate")
	public String companyUpdate(Company company) throws IOException {
		MultipartFile imgupload = company.getImgupload();
		if (!imgupload.isEmpty()) {
			String fileName = imgupload.getOriginalFilename();
			company.setOriginalfile(fileName);
			String saveFolder = mysavefolder.getSavefolder();
			String fileDBName = MemberController.fileDBName(fileName, saveFolder);
			imgupload.transferTo(new File(saveFolder + fileDBName));
			company.setCompany_logo(fileDBName);
		}
		companyservice.companyUpdate(company);
		return "redirect:../admin/company";
	}

	@GetMapping("/comCheck")
	public void comCheck(String dept_name, String job_name, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.print("omg");

	}

	// 회의실 관리
	@GetMapping("/meetManage")
	public ModelAndView meetmanage(ModelAndView mv) {
		List<MeetingRoom> mr = meetservice.meetingRoomAll();
		mv.setViewName("meeting/meetManage");
		mv.addObject("list", mr);
		return mv;
	}

	@GetMapping("/meetAdd")
	public String meetAdd() {
		return "meeting/meetManageAdd";
	}

	@PostMapping("/meetAddProcess")
	public ModelAndView meetAddProcess(ModelAndView mv, MeetingRoom mr) throws IllegalStateException, IOException {

		MultipartFile imgupload = mr.getImgupload();
		if (!imgupload.isEmpty()) {
			String fileName = imgupload.getOriginalFilename();
			mr.setMeet_imgoriginal(fileName);
			String saveFolder = mysavefolder.getSavefolder();
			String fileDBName = MemberController.fileDBName(fileName, saveFolder);
			imgupload.transferTo(new File(saveFolder + fileDBName));
			mr.setMeet_img(fileDBName);
		}
		meetservice.addMeetRoom(mr);
		mv.setViewName("redirect:../admin/meetManage");
		return mv;
	}

	@GetMapping("/meetModify")
	public ModelAndView meetModify(ModelAndView mv, int meet_no, MeetingRoom mRoom) {
		mRoom = meetservice.meetRoomSelect(meet_no);
		mv.setViewName("meeting/meetModi");
		mv.addObject("mr", mRoom);
		return mv;
	}

	@PostMapping("/meetModiProcess")
	public String meetModiProcess(MeetingRoom mr) throws IllegalStateException, IOException {
		MultipartFile imgupload = mr.getImgupload();
		if (!imgupload.isEmpty()) {
			String fileName = imgupload.getOriginalFilename();
			mr.setMeet_imgoriginal(fileName);
			String saveFolder = mysavefolder.getSavefolder();
			String fileDBName = MemberController.fileDBName(fileName, saveFolder);
			imgupload.transferTo(new File(saveFolder + fileDBName));
			mr.setMeet_img(fileDBName);
		}

		meetservice.meetingRoomUpdate(mr);
		return "redirect:../admin/meetModify?meet_no=" + mr.getMeet_no();

	}

}