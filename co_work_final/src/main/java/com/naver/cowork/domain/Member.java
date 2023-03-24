package com.naver.cowork.domain;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String user_id;
	private String user_password;
	private String user_email;
	private int user_code;
	private String user_name;
	private String user_img;
	private String user_auth = "ROLE_MEMBER";
	private int user_dept;
	private int user_job;
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

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public MultipartFile getImgupload() {
		return imgupload;
	}

	public void setImgupload(MultipartFile imgupload) {
		this.imgupload = imgupload;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getUser_auth() {
		return user_auth;
	}

	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}

	public int getUser_dept() {
		return user_dept;
	}

	public void setUser_dept(int user_dept) {
		this.user_dept = user_dept;
	}

	public int getUser_job() {
		return user_job;
	}

	public void setUser_job(int user_job) {
		this.user_job = user_job;
	}

	public String getUser_fax() {
		return user_fax;
	}

	public void setUser_fax(String user_fax) {
		this.user_fax = user_fax;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getUser_card() {
		return user_card;
	}

	public void setUser_card(String user_card) {
		this.user_card = user_card;
	}

	public String getUser_state() {
		return user_state;
	}

	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}

	public String getUser_join_date() {
		return user_join_date.substring(0, 10);
	}

	public void setUser_join_date(String user_join_date) {
		this.user_join_date = user_join_date;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_lasttime() {
		return user_lasttime;
	}

	public void setUser_lasttime(String user_lasttime) {
		this.user_lasttime = user_lasttime;
	}

	public String getUser_password_ch() {
		return user_password_ch;
	}

	public void setUser_password_ch(String user_password_ch) {
		this.user_password_ch = user_password_ch;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getCreatewho() {
		return createwho;
	}

	public void setCreatewho(String createwho) {
		this.createwho = createwho;
	}

	public String getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}

	public String getUpdatewho() {
		return updatewho;
	}

	public void setUpdatewho(String updatewho) {
		this.updatewho = updatewho;
             
  }
	
}
