package com.naver.cowork.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.MeetReservation;
import com.naver.cowork.domain.MeetingRoom;
import com.naver.cowork.domain.PageDto;
import com.naver.cowork.service.MeetingRoomService;

@Controller
@RequestMapping("/meet")
public class MeetingController {

   private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);

   private MeetingRoomService meetservice;

   @Autowired
   public MeetingController(MeetingRoomService meetservice) {
      this.meetservice = meetservice;
   }

   // 예약 페이지 이동
   @GetMapping("/rev")
   public ModelAndView main(ModelAndView mv) {
      List<MeetingRoom> mr = meetservice.meetingRoomAll();
      mv.setViewName("meeting/meetingRoom");
      mv.addObject("list", mr);
      return mv;
   }
   
   // 예약내역 이동
   @GetMapping("/revstat")
   public ModelAndView revstat(ModelAndView mv, Principal principal, Criteria cri) {
      String user_id = principal.getName();
      cri.setUser_id(user_id);
      List<MeetReservation> mr = meetservice.getMeetList(cri);
      int total = meetservice.getMeetCount(cri);
      PageDto pageMaker = new PageDto(cri, total);
      mv.setViewName("meeting/meetRevStat");
      
      mv.addObject("list", mr);
      mv.addObject("pageMaker", pageMaker);
      return mv;
   }

   // 회의실 예약 페이지 이동
   @GetMapping("/rev/{meet_no}")
   public ModelAndView rev(ModelAndView mv, @PathVariable("meet_no") int meet_no, Principal principal) {
      List<MeetReservation> mr = meetservice.getReserv(meet_no);
      MeetingRoom mRoom = new MeetingRoom();
      String myId = principal.getName();
      mRoom = meetservice.meetRoomSelect(meet_no);
      mv.setViewName("meeting/meetRev");
      mv.addObject("list", mr);
      mv.addObject("roomInfo", mRoom);
      mv.addObject("myid", myId);
      return mv;
   }

   // 회의실 예약 추가
   @PostMapping("/meetAdd")
   public String meetadd(MeetReservation mr, Principal principal, String meet_no) {
      String user_id = principal.getName();

      mr.setUser_id(user_id);
      mr.setRev_start_time(mr.getRev_start_date() + " " + mr.getRev_start_time());
      mr.setRev_end_time(mr.getRev_start_date() + " " + mr.getRev_end_time());
      int result = meetservice.insertReserv(mr);
      if (result == 1) {
         logger.info("예약완료");
      }
      return "redirect:../meet/rev/" + meet_no;
   }
   
   // 회의실 예약 시간 검사
//   @GetMapping("/dateTest")
//   public List<Map<String, Object>> dateTest(MeetReservation mr, HttpServletResponse response) {
//      int meetNo = mr.getMeet_no();
//      String startDate = mr.getRev_start_date();
//      logger.info(startDate);
//      String newDate = startDate.substring(2, 4) + "/" + startDate.substring(5, 7) + "/" + startDate.substring(8, 10);
//      logger.info(newDate);
//      
//      List<Map<String, Object>> map = meetservice.getRevTime(meetNo, newDate);
//      
//            
//      return map;
//   }
   
   @GetMapping("/meetDelete/{rev_no}")
   public String meetdelete(HttpServletResponse response, HttpServletRequest request,@PathVariable("rev_no") int rev_no) throws IOException {
      int result = meetservice.meetDelete(rev_no);
      String referer = request.getHeader("Referer");
      return "redirect:" + referer;
   }
      
   
}