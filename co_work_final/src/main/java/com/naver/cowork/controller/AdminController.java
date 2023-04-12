package com.naver.cowork.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Job;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.service.DeptService;
import com.naver.cowork.service.JobService;
import com.naver.cowork.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    private MemberService memberservice;
    private DeptService deptservice;
    private JobService jobservice;
    private MySaveFolder mysavefolder;


    @Autowired
    public AdminController(MemberService memberService, DeptService deptservice, JobService jobservice, MySaveFolder mysavefolder) {
        this.memberservice = memberService;
        this.deptservice = deptservice;
        this.jobservice = jobservice;
        this.mysavefolder = mysavefolder;
    }

    @GetMapping("/members")
    public ModelAndView members(ModelAndView mv, Member member) {
        List<Member> m = memberservice.members();
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
//        mv.addObject("deptName", deptName);
//        mv.addObject("jobName", jobName);


        return mv;
    }

    @GetMapping("/company")
    public ModelAndView company(ModelAndView mv) {
        List<Dept> d = deptservice.deptAll();
        List<Job> j = jobservice.jobAll();
        int dmaxNo = deptservice.dmaxNo();
        int jmaxNo = jobservice.jmaxNo();

        mv.setViewName("admin/company/companyinfo");
        mv.addObject("dept", d);
        mv.addObject("job", j);
        mv.addObject("dmaxno", dmaxNo);
        mv.addObject("jmaxno", jmaxNo);
        return mv;
    }

    @PostMapping("/deptadd")
    public ModelAndView deptadd(ModelAndView mv, Dept dept) {
        logger.info(dept.getDept_name() + dept.getDept_no());

        int result = deptservice.insert(dept);
        if (result == 1) {
            logger.info("삽입 성공");
            mv.setViewName("redirect:company");
        } else {
            logger.info("삽입 실패");
            mv.setViewName("redirect:company");
        }
        return mv;
    }

    @PostMapping("deleteDept")
    public String deleteDept(@RequestParam List<Integer> dept_no, Dept dept) {

        for (Integer c : dept_no) {
            dept.setDept_no(c);
            System.out.println(dept.getDept_no());
            int result = deptservice.delete(dept.getDept_no());
            if (result > 0) {
                logger.info("delete success");
            }
        }
        return "redirect:/admin/company";
    }

    @PostMapping("/jobadd")
    public ModelAndView jobadd(ModelAndView mv, Job job) {
        logger.info(job.getJob_name() + job.getJob_no());

        int result = jobservice.insert(job);

        if (result == 1) {
            mv.setViewName("redirect:company");
        } else {
            mv.setViewName("redirect:company");
        }
        return mv;
    }

    @PostMapping("deleteJob")
    public String deleteJob(@RequestParam List<Integer> job_no) {

        for (Integer c : job_no) {
            Job job = new Job();
            job.setJob_no(c);
            int result = jobservice.delete(job.getJob_no());
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
}