//package com.naver.cowork.task;
//
//import java.io.File;
//
//import javax.mail.internet.MimeMessage;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.core.io.FileSystemResource;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.mail.javamail.MimeMessagePreparator;
//import org.springframework.stereotype.Component;
//
//import com.naver.cowork.domain.MailVO;
//import com.naver.cowork.domain.MySaveFolder;
//
//@Component
//public class SendMail {
//	@Value("${spring.mail.username}")
//	String sender;
//	
//	@Autowired
//	private JavaMailSenderImpl mailSender;
//
//	@Autowired
//	private MySaveFolder mysavefolder;
//
//	private static final Logger logger = LoggerFactory.getLogger(SendMail.class);
//
//	public String sendMail(MailVO vo) {
//
//		String sendfile = mysavefolder.getSendfile();
//
//		MimeMessagePreparator mp = new MimeMessagePreparator() {
//
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				helper.setFrom(sender);
//				helper.setTo(vo.getTo());
//				helper.setSubject(vo.getSubject());
//				String content = vo.getContent();
//				helper.setText(content, true);
//			}
//
//		};
//
//		mailSender.send(mp);
//		logger.info("메일 전송했습니다.");
//		return vo.getContent();
//	}
//
//}
