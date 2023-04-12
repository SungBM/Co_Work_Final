package com.naver.cowork.domain;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class MeetReservation {
	private int rev_no; // 예약 번호
	private int meet_no; // 회의실 번호
	private String user_id; // 예약한 회원 ID
	private String rev_start_time; // 회의 시작 시간
	private String rev_end_time; // 회의 종료 시간
	private int rev_people; // 회의 인원
	private String rev_content; // 예약 내용
	private int rev_status; // 회의 상태
	
	private String rev_start_date;  // 회의 날짜
	
	private String user_name;
    private Object user_dept;
    private Object user_job;
    private String dept_name;
    private String job_name;
    private String meet_name;
}