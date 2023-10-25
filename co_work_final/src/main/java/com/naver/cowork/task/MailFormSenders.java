package com.naver.cowork.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.naver.cowork.domain.MailVO;

@Component
public class MailFormSenders extends SendMailService {
	
	private static final Logger logger = LoggerFactory.getLogger(MailFormSenders.class);
	@Override
	public String sendMail(MailVO vo) {

		return super.sendMail(vo);
	}
	
	public MailVO setMailInfo(String from,String to){
	        MailVO mail = new MailVO();
	    	mail.setFrom(from);
	        mail.setTo(to);
	        mail.setSubject("Co_Work에서 발송한 인증번호입니다");
	        mail.setContent("" + (int)Math.floor((Math.random()*(99999-10000+1)))+10000);
	        String re =  sendMail(mail);
	        logger.info(re);
	        
	        return mail;
	    }
}
