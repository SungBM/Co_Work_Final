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

	public int insertReserv(MeetReservation mr);
	
	public MeetingRoom meetRoomSelect(int meet_no);
	
	public int meetDelete(int rev_no);

	public List<MeetReservation> getMeetRev(String user_id);
	
	public List<MeetReservation> getMeetList(Criteria cri);  // 예약목록
	
	public int getMeetCount(Criteria cri);  // 예약목록 카운트
}
