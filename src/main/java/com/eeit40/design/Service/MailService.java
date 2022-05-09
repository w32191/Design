package com.eeit40.design.Service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.eeit40.design.Dao.AccountRepository;
import com.eeit40.design.Dao.MemberRepository;
import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Member;

@Service
public class MailService {

//	private static final String FROM = null;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	freemarker.template.Configuration freemarkerConfig;
	
	@Autowired
	private MemberRepository member;
	
	@Autowired
	private AccountRepository account;
	
	private static final String FROM= "eeit40@gmail.com";
	
    // test Spring Mail
	public void sendSimpleMail() throws Exception {
		SimpleMailMessage message = new SimpleMailMessage();
		// SpringMail吃properties檔的設定(eeit40@gmail.com)，所以setFrom()是沒有用的
		// message.setFrom("eeit40@gmail.com");
		message.setTo("taco5826@gmail.com");
		message.setSubject("主旨：Hello, Test Sending Email");
		message.setText("內容：這是一封測試信件，恭喜您成功發送了唷");
		mailSender.send(message);
	}
	
    // test Spring Mail with Attachment
	public void sendAttachMail() throws Exception {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		helper.setTo("taco5826@gmail.com");
		helper.setSubject("主旨：Hello, Test Sending Email With Picture Link");
		// template.html的EL數據
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("names", "何娜娜");
		// email的HTML內容
		String attachment = FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerConfig.getTemplate("template.html"), model);
		helper.setText(attachment, true);
		// email的HTML內容中的圖片
		File file = new File("");
		String image = file.getAbsolutePath() + "/src/main/webapp/static/front/assets/img/logo/logo.png";
		FileSystemResource img = new FileSystemResource(new File(image));
		helper.addInline("logo", img);
		
		mailSender.send(mimeMessage);
	}
	
	//訂單成立後寄送mail
	public void sendMailAfterOrder(int id) throws MessagingException, Exception {
		
		Account user = account.getById(id);
//		Account user = account.getById(id).getMembers().getFkAccount();
//		Member user = member.getById(id);
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true);
		helper.setFrom(FROM,"DESIGN & DECOR");
		helper.setTo(user.getEmail());
//		helper.setTo("taco5826@gmail.com");
		helper.setSubject("您的訂單下單成功");
		
		// template.html的EL數據
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("membername", user.getMembers().getNames());
		
		// email的HTML內容
		String attachment = FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerConfig.getTemplate("ShoppingCartOrder.html"), model);
		helper.setText(attachment,true);
		
		// email的HTML內容中的圖片
		File file = new File("");
		String image = file.getAbsolutePath()+"/src/main/webapp/static/front/assets/img/logo/LOGO黑字去背300px.png"; //要更換
		FileSystemResource img = new FileSystemResource(new File(image));
		helper.addInline("logo", img);
		
		mailSender.send(mimeMessage);
	}
	
	
}
