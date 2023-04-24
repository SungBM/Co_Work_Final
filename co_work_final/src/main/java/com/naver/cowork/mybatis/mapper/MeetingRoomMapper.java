package com.naver.cowork.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.cowork.domain.Criteria;
import com.naver.cowork.domain.MeetReservation;
import com.naver.cowork.domain.MeetingRoom;

@Mapper
public interface MeetingRoomMapper {

	public List<MeetingRoom> meetingRoomAll();

	public List<MeetReservation> getReserv(int meet_no);
	
	public List<Map<String, Object>> getRevTime(int meetNo, String startDate);

	public int insertReserv(MeetReservation mr);  // 예약추가
	
	public MeetingRoom meetRoomSelect(int meet_no);  // 선택한 회의실 정보 가져오기
	
	public int meetDelete(int rev_no);  // 예약 삭제

	public List<MeetReservation> getMeetRev(String user_id);  // id에 맞는 예약정보 가져오기
	
	public List<MeetReservation> getMeetList(Criteria cri);  // 예약목록
	
	public int getMeetCount(Criteria cri);  // 예약목록 카운트
	
	public int addMeetRoom(MeetingRoom mr); // 회의실 추가
	
	public int meetingRoomUpdate(MeetingRoom mr);  // 회의실 정보 업데이트

	public int meetRoomDelete(int meetNo); // 회의실 삭제

}
