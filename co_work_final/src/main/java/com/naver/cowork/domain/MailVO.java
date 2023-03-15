package com.naver.cowork.domain;

public class MailVO {
	private String from = "admin"; // mail.properties���� �ۼ��� ���̵� �ش��ϴ� �̸��� �ּ� �ۼ�
	private String to;
	private String subject = "제목";
	private String content = "내용";

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
