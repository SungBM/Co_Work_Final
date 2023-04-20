package com.naver.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.MeetReservation;
import com.naver.cowork.domain.MeetingRoom;

@Service
public interface MeetingRoomService {
	
	// 회의실 전체 조회
    public List<MeetingRoom> meetingRoomAll();
    // 회의실 예약 내역 조회
	public List<MeetReservation> getReserv(int meet_no);
	// 회의 예약 삽입
	public int insertReserv(MeetReservation mr);

	// 작업중...
	public List<Map<String, Object>> getRevTime(int meetNo, String startDate);
	// 선택한 회의실 정보
	public MeetingRoom meetRoomSelect(int meet_no);
	// 회의 예약 삭제
	public int meetDelete(int rev_no);

	public List<MeetReservation> getMeetRev(String user_id);

	public List<MeetReservation> getMeetList(Criteria cri);  // 예약목록
	
	public int getMeetCount(Criteria cri);  // 예약목록 카운트
	
	public int addMeetRoom(MeetingRoom mr);
	
	public int meetingRoomUpdate(MeetingRoom mr);

    public int meetRoomDelete(int meetNo);
}