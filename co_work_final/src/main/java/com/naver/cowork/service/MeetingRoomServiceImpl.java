package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.MeetReservation;
import com.naver.cowork.domain.MeetingRoom;
import com.naver.cowork.mybatis.mapper.MeetingRoomMapper;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService {

    private MeetingRoomMapper dao;

    @Autowired
    public MeetingRoomServiceImpl(MeetingRoomMapper dao) {
        this.dao = dao;
    }

    public List<MeetingRoom> meetingRoomAll() {
        return dao.meetingRoomAll();
    }

    @Cacheable(value="deptList")
    public List<MeetReservation> getReserv(int meet_no) {
        return dao.getReserv(meet_no);
    }

    @Transactional
    public int insertReserv(MeetReservation mr) {
        return dao.insertReserv(mr);
    }

    public List<Map<String, Object>> getRevTime(int meetNo, String startDate) {
        return dao.getRevTime(meetNo, startDate);
    }

    public MeetingRoom meetRoomSelect(int meet_no) {
        return dao.meetRoomSelect(meet_no);
    }

    @Transactional
    public int meetDelete(int rev_no) {
        return dao.meetDelete(rev_no);
    }


    public List<MeetReservation> getMeetRev(String user_id) {
        List<MeetReservation> list = dao.getMeetRev(user_id);
        System.out.println(list.get(0).getRev_end_time());

        for (MeetReservation mr : list) {
            String startDate = mr.getRev_start_time().substring(0, 16);
            String endDate = mr.getRev_end_time().substring(11, 16);
            mr.setRev_start_time(startDate);
            mr.setRev_end_time(endDate);
        }

        return list;
    }

    // 예약목록
    public List<MeetReservation> getMeetList(Criteria cri) {
        return dao.getMeetList(cri);
    }

    // 예약목록 카운트
    public int getMeetCount(Criteria cri) {
        return dao.getMeetCount(cri);
    }

    @Transactional
    public int addMeetRoom(MeetingRoom mr) {
        return dao.addMeetRoom(mr);
    }

    @Transactional
    public int meetingRoomUpdate(MeetingRoom mr) {
        return dao.meetingRoomUpdate(mr);
    }

    @Transactional
    public int meetRoomDelete(int meetNo){
        return dao.meetRoomDelete(meetNo);
    }
}