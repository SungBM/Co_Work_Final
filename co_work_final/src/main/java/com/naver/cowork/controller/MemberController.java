package com.naver.cowork.controller;


import com.naver.cowork.domain.Job;
import com.naver.cowork.domain.MailVO;
import com.naver.cowork.domain.Member;
import com.naver.cowork.domain.MySaveFolder;
import com.naver.cowork.service.CalService;
import com.naver.cowork.service.MemberService;
import com.naver.cowork.task.SendMail;

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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static java.lang.System.out;


@Controller
@RequestMapping("/member")
public class MemberController {


    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    private MemberService meberService;
    private CalService calservice;
    private PasswordEncoder passwordEncoder;
    private SendMail sendMail;
    private MySaveFolder mysavefolder;

    @Autowired
    public MemberController(MemberService meberService, SendMail sendMail, PasswordEncoder passwordEncoder, MySaveFolder mysavefolder, CalService calservice) {
        this.meberService = meberService;
        this.sendMail = sendMail;
        this.passwordEncoder = passwordEncoder;
        this.mysavefolder = mysavefolder;
        this.calservice = calservice;
    }


    @GetMapping("/mypage")
    public ModelAndView mypage(Principal principal, ModelAndView mv, HttpServletRequest request) {
        String user_id = principal.getName();
        Member m = meberService.member_info(user_id);
        String saveFolder = mysavefolder.getSavefolder();
        String sFilePath = saveFolder + m.getUser_card();

        mv.setViewName("mypage/mypage");
        mv.addObject("memberinfo", m);
        mv.addObject("path", m.getUser_card());

        return mv;
    }

    @GetMapping("/updateCheck")
    public void updateCheck(@RequestBody Member member, Principal principal, HttpServletResponse response) throws Exception {
        String user_id = member.getUser_id();
        Member m = meberService.member_info(user_id);
        PrintWriter out = response.getWriter();
        if (m.getUser_phone() == null && m.getUser_fax() == null) {
            if (member.getUser_phone() == "" && member.getUser_fax() == "") {
                out.print("fail");
            } else {
                out.print("success");
            }
        } else if (m.getUser_phone() != null && m.getUser_fax() == null) {
            if (m.getUser_phone().equals(member.getUser_phone()) && member.getUser_fax() == "") {
                out.print("fail");
            } else {
                out.print("success");
            }
        } else if (m.getUser_phone() == null && m.getUser_fax() != null) {
            if (m.getUser_fax().equals(member.getUser_fax()) && member.getUser_phone() == "") {
                out.print("fail");
            } else {
                out.print("success");
            }
        } else if (m.getUser_phone() != null && m.getUser_fax() != null) {
            if (m.getUser_phone().equals(member.getUser_phone()) && m.getUser_fax().equals(member.getUser_fax())) {
                out.print("fail");
            } else {
                out.print("success");
            }
        }
    }

    @PostMapping("/updateProcess")
    public String updateProcess(Member member, HttpServletRequest request) throws Exception {
        MultipartFile imgupload = member.getImgupload();

        if (!imgupload.isEmpty()) {
            String fileName = imgupload.getOriginalFilename();
            member.setOriginalfile(fileName);

            String saveFolder = mysavefolder.getSavefolder();
            String fileDBName = fileDBName(fileName, saveFolder);
            logger.info("fileDBName = " + fileDBName);

            imgupload.transferTo(new File(saveFolder + fileDBName));
            logger.info("transferTo.path = " + saveFolder + fileDBName);

            member.setUser_card(fileDBName);
        }

        int result = meberService.update(member);
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

        // 종일 체크 안할 시 시간까지 저장
        if (calendar.getCal_allday() == null) {
            String start_full_date = calendar.getCal_start_date() + " " + calendar.getCal_start_time();
            String end_full_date = calendar.getCal_end_date() + " " + calendar.getCal_end_time();
            calendar.setCal_start_date(start_full_date);
            calendar.setCal_end_date(end_full_date);
        } else {
            // end 날짜가 하루 뒤어야 일정바가 날짜에 맞춰짐
            String end_full_date = calendar.getCal_end_date() + " " + calendar.getCal_end_time();
            SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date = transFormat.parse(end_full_date);
            Calendar cal1 = Calendar.getInstance();
            cal1.setTime(date); // 시간 설정
            cal1.add(Calendar.DATE, 1); // 일 연산
            String strDate = transFormat.format(cal1.getTime());
            logger.info(strDate);

            calendar.setCal_end_date(strDate);
        }

        if (calendar.getCal_type().equals("C")) {
            calendar.setCal_color("#28a745");
        } else {
            calendar.setCal_color("#ffc107");
        }

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

    @PostMapping("/calSelect")
    public Model calSelect(@RequestParam List<String> cal_type, Principal principal, Model mv) {
        String user_id = principal.getName();

        return mv;
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


    @GetMapping("/modifyPassword")
    public String modifyPassword() {

        return "config/modifypassword";
    }

    @GetMapping("/mysecurity")
    public ModelAndView mysecurity(String user_id, ModelAndView mv, HttpServletRequest request) {
        Member m = meberService.member_info(user_id);
        String saveFolder = mysavefolder.getSavefolder();
        String sFilePath = saveFolder + m.getUser_card();
        logger.info(sFilePath);


        mv.setViewName("mypage/mysecurity");
        mv.addObject("memberinfo", m);
        mv.addObject("path", m.getUser_card());

        return mv;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(ModelAndView mv, @CookieValue(value = "remember-me", required = false) Cookie
            readCookie,
                              HttpSession session, Principal userPrincipal) {
        mv.setViewName("/member/loginForm");

        return mv;
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String join() {
        return "member/joinForm";
    }

    @RequestMapping(value = "/joinProcess")
    public String joinProcess(Member member, RedirectAttributes rattr,
                              Model model, HttpServletRequest request) {
        // 비밀번호 암호화 추가.
        String id = member.getUser_id();
        String email = member.getUser_email();
        String name = member.getUser_name();
        String encPassword = passwordEncoder.encode(member.getUser_password());
        String role = member.getUser_auth();


        member.setUser_password(encPassword);

        int result = meberService.insert(member);

        // result=0; //에러페이지 확인용
        /*
         * 스프링에서 제공하는 RedirectAttributes는 기존의 Servlet에서 사용되던 response.sendRedirect()를
         * 사용할 때와 동일한 용도로 사용합니다. 리다이렉트로 전송하면 파라미터를 전달하고자 할 때 addAttribute()나
         * addFlashAttribute()를 사용합니다. 예) response.sendRedirect("/test?result=1"); =>
         * rattr.addAttribute("result", 1);
         */
        // 삽입이 된 경우
        if (result == 1) {
            rattr.addFlashAttribute("result", "joinSuccess");
            return "redirect:login";
        } else {
            model.addAttribute("url", request.getRequestURI());
            model.addAttribute("message", "회원 가입 실패");
            return "error/error";
        }
    }

    @RequestMapping(value = "/idcheck", method = RequestMethod.GET)
    public void idcheck(@RequestParam("user_id") String id, // member_joinForm에서 가져온 id값이 String형 id로 저장됨.
                        HttpServletResponse response) throws Exception {
        int result = meberService.isId(id);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(result);
    }

    @GetMapping(value = "/sendMail")
    public void sendMail(@RequestParam("user_email") String receiver, HttpServletResponse response)
            throws Exception {
        MailVO mail = new MailVO();
        mail.setTo(receiver);
        String num = sendMail.sendMail(mail);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(num);
    }


}
