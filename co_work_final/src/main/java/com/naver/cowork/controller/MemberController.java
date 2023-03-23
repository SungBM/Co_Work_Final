package com.naver.cowork.controller;

import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.service.MemberService;
import oracle.jdbc.proxy.annotation.Post;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Calendar;
import java.util.Random;

@Controller
@RequestMapping("/member")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    private MemberService memberservice;
    private MySaveFolder mysavefolder;

    @Autowired
    public MemberController(MemberService memberService, MySaveFolder mysavefolder) {
        this.memberservice = memberService;
        this.mysavefolder = mysavefolder;
    }

    @GetMapping("/login")
    public ModelAndView login(ModelAndView mv, @CookieValue(value = "remember-me", required = false) Cookie readCookie,
                              HttpSession session, Principal userPrincipal) {
        logger.info("안녕...한글이 안돼");

        if (readCookie != null) {
            logger.info("??? ??? : " + userPrincipal.getName()); // principal.getName() : ???? ???
            mv.setViewName("redirect:/member/main");
        } else {
            mv.setViewName("member/loginForm");
            mv.addObject("loginfail", session.getAttribute("loginfail"));
            session.removeAttribute("loginfail");
        }
        return mv;
    }

    @PostMapping("/main")
    public String main() {
        return "member/main";
    }

    @GetMapping("/main")
    public String mainGet() {
        return "member/main";
    }


    @GetMapping("/mypage")
    public ModelAndView mypage(String user_id, ModelAndView mv, HttpServletRequest request) {
        logger.info("id = " + user_id);
        Member m = memberservice.member_info(user_id);
        String saveFolder = mysavefolder.getSavefolder();
        String sFilePath = saveFolder + m.getUser_card();
        logger.info(sFilePath);


        mv.setViewName("mypage/mypage");
        mv.addObject("memberinfo", m);
        mv.addObject("path", m.getUser_card());

        return mv;
    }

    @PostMapping("updateCheck")
    public void updateCheck(@RequestBody Member member, Principal principal, HttpServletResponse response) throws Exception {
        String user_id = member.getUser_id();
        Member m = memberservice.member_info(user_id);
        PrintWriter out = response.getWriter();

        if (!m.getUser_phone().equals(member.getUser_phone()) || !m.getUser_fax().equals(member.getUser_fax())) {
            out.print("success");
            logger.info("modify mypage");
        } else {
            out.print("fail");
            logger.info("not modify mypage");
        }
    }

    @PostMapping("updateProcess")
    public String updateProcess(Member member, HttpServletRequest request) throws Exception {
        MultipartFile imgupload = member.getImgupload();

        if(!imgupload.isEmpty()){
            String fileName = imgupload.getOriginalFilename();
            member.setOriginalfile(fileName);

            String saveFolder = mysavefolder.getSavefolder();
            String fileDBName = fileDBName(fileName, saveFolder);
            logger.info("fileDBName = " + fileDBName);

            imgupload.transferTo(new File(saveFolder + fileDBName));
            logger.info("transferTo.path = " + saveFolder + fileDBName);

            member.setUser_card(fileDBName);
        }

        int result = memberservice.update(member);
        return "redirect:../member/mypage";
    }

    private String fileDBName(String fileName, String saveFolder) {
        // 새로운 폴더 이름 : 오늘 년+월+일
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR); // 오늘 연도
        int month = c.get(Calendar.MONTH) + 1; // 오늘 월
        int date = c.get(Calendar.DATE); // 오늘 일

        String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
        logger.info(homedir);
        File path1 = new File(homedir);
        if (!(path1.exists())) {
            path1.mkdir(); // 새로운 폴더를 생성
        }

        // 난수를 구합니다.
        Random r = new Random();
        int random = r.nextInt(100000000);

        /*** 확장자 구하기 시작 ***/
        int index = fileName.lastIndexOf(".");
        // 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
        // indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반명,
        // lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
        // (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
        logger.info("index = " + index);

        String fileExtension = fileName.substring(index + 1);
        logger.info("fileExtention = " + fileExtension);
        /*** 확장자 구하기 끝 ***/

        // 새로운 파일명
        String refileName = "bbs" + year + month + date + random + "." + fileExtension;
        logger.info("refileName = " + refileName);

        // 오라클 디비에 저장될 파일명
        // String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
        String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
        logger.info("fileDBName = " + fileDBName);
        return fileDBName;
    }

    @GetMapping("calendar")
    public String calendar() {

        return "calendar/calendar";
    }

    @GetMapping("modifyPassword")
    public String modifyPassword() {

        return "config/modifypassword";
    }

    @GetMapping("/mysecurity")
    public ModelAndView mysecurity(String user_id, ModelAndView mv, HttpServletRequest request) {
        Member m = memberservice.member_info(user_id);
        String saveFolder = mysavefolder.getSavefolder();
        String sFilePath = saveFolder + m.getUser_card();
        logger.info(sFilePath);


        mv.setViewName("mypage/mysecurity");
        mv.addObject("memberinfo", m);
        mv.addObject("path", m.getUser_card());

        return mv;
    }


}
