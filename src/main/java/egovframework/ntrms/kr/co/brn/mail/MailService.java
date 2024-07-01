package egovframework.ntrms.kr.co.brn.mail;

import java.io.File;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service("mailService")
public class MailService {
	protected Log logger = LogFactory.getLog(this.getClass());
	@Autowired 
	private JavaMailSender mailSender;
	
	private String from = "nextlevel@nexentire.com";
	
	//setFrom(String from) 			- 발신자 설정
	//setReplyTo(String replyTo) 	- 응답 주소 설정
	//setTo(String to) 				- 수신자 설정
	//setTo(String[] to) 			- 수신자 목록 설정
	//setCc(String cc) 				- 참조자 설정
	//setCc(String[] cc) 			- 참조자 목록 설정
	//setBcc(String bcc) 			- 숨은 참조자 설정
	//setBcc(String[] bcc) 			- 숨은 참조자 목록 설정
	//setSentDate(Date sentDate) 	- 메일 발송일 설정
	//setSubject(String subject) 	- 메일 제목(주제) 설정
	//setText(String text) 			- 메일 내용 설정
	
	public boolean sendMail(String to, String subject, String textImg, String filePath, String fileName) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "EUC-KR");
			
			messageHelper.setTo(to);
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);
			
			//messageHelper.setText(text);
			messageHelper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
			
			FileSystemResource res = new FileSystemResource(new File(textImg));
			messageHelper.addInline("identifier1234", res);
			
			FileSystemResource file = new FileSystemResource(new File(filePath+"/"+fileName));
			messageHelper.addAttachment(fileName, file);
			
			mailSender.send(message);
		} catch(Exception e){
			logger.error("mail excetion : " + e);
			return false;
		}
		
		return true;
	}
}
