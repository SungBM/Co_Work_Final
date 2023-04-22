package com.naver.cowork.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetingRoom {
	private int meet_no; // 회의실 번호
	private String meet_name; // 회의실 이름
	private int meet_max_people; // 회의실 최대 인원
	private String meet_info; // 회의실 정보
	private String meet_status; // 회의실 상태(WT:예약불가 CP:예약가능)
	private String meet_img; // 회의실 사진
	private String meet_imgoriginal; // 회의실 사진 원본 파일명?? 필요없나...?
    private MultipartFile imgupload;
}