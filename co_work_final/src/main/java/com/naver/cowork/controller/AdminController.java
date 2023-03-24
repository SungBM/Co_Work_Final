package com.naver.cowork.controller;

import com.naver.cowork.domain.Dept;
import com.naver.cowork.domain.Job;
import com.naver.cowork.domain.Member;
import com.naver.cowork.service.DeptService;
import com.naver.cowork.service.JobService;
import com.naver.cowork.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    private MemberService memberservice;
    private DeptService deptservice;
    private JobService jobservice;

    @Autowired
    public AdminController(MemberService memberService, DeptService deptservice, JobService jobservice) {
        this.memberservice = memberService;
        this.deptservice = deptservice;
        this.jobservice = jobservice;
    }

    @GetMapping("/members")
    public ModelAndView members(ModelAndView mv) {
        List<Member> m = memberservice.members();
        if (m == null) {
            logger.info("members에 m은 null이다.");
        } else {
            mv.setViewName("admin/members/membersinfo");
            mv.addObject("list", m);
        }
        return mv;
    }

    @GetMapping("/company")
    public ModelAndView company(ModelAndView mv) {
        List<Dept> d =deptservice.deptAll();
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
    public ModelAndView deptadd(ModelAndView mv, Dept dept){
        logger.info(dept.getDept_name() + dept.getDept_no());

        int result = deptservice.insert(dept);
        if(result == 1){
            logger.info("삽입 성공");
            mv.setViewName("redirect:company");
        } else {
            logger.info("삽입 실패");
            mv.setViewName("redirect:company");
        }
        return mv;
    }

    @PostMapping("deleteDept")
    public String deleteDept(@RequestParam List<Integer> dept_no){

        for(Integer c : dept_no){
            System.out.println(c);
            Dept dept = new Dept();
            dept.setDept_no(c);
            int result = deptservice.delete(dept.getDept_no());
            if(result > 0){
                logger.info("delete success");
            }
        }
        return "redirect:/admin/company";
    }

    @PostMapping("/jobadd")
    public ModelAndView jobadd(ModelAndView mv, Job job){
        logger.info(job.getJob_name() + job.getJob_no());

        int result = jobservice.insert(job);
        if(result == 1){
            logger.info("삽입 성공");
            mv.setViewName("redirect:company");
        } else {
            logger.info("삽입 실패");
            mv.setViewName("redirect:company");
        }
        return mv;
    }

    @PostMapping("deleteJob")
    public String deleteJob(@RequestParam List<Integer> job_no){

        for(Integer c : job_no){
            System.out.println(c);
            Job job = new Job();
            job.setJob_no(c);
            int result = jobservice.delete(job.getJob_no());
            if(result > 0){
                logger.info("delete success");
            }
        }
        return "redirect:/admin/company";
    }


}
