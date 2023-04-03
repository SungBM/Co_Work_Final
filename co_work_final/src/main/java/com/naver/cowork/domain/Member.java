package com.naver.cowork.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class Member {

	private String user_id;
	private String user_password;
	private String user_email;
	private int user_code;
	private String user_name;
	private String user_img;
	private String user_auth = "ROLE_MEMBER";
	private int user_dept;
	private String dept_name;
	private int user_job;
	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	private String user_fax;
	private String user_intro;
	private String user_card;
	private String user_state;
	private String user_join_date;
	private String user_phone;
	private String user_lasttime;
	private String user_password_ch;
	private String created_at;
	private String createwho;
	private String update_at;
	private String updatewho;
	private MultipartFile imgupload;
	private String originalfile;

}
