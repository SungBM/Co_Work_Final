package com.naver.cowork.domain;

public class MailVO {
	private String from = "msb9876";
	private String to;
	private String subject = "Co_Work에서 발송한 인증번호입니다";
	private String content = "" + (int)Math.floor((Math.random()*(99999-10000+1)))+10000;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
