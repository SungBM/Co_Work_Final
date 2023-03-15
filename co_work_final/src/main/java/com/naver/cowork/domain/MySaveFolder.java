package com.naver.cowork.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "my")
public class MySaveFolder {
	private String savefolder;
	private String sendfile;

	public String getSavefolder() {
		return savefolder;
	}

	public void setSavefolder(String savefolder) {
		this.savefolder = savefolder;
	}

	public String getSendfile() {
		return sendfile;
	}

	public void setSendfile(String sendfile) {
		this.sendfile = sendfile;
	}

}
