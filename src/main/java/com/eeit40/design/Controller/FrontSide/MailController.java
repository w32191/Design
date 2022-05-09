package com.eeit40.design.Controller.FrontSide;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit40.design.Service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService mailservice;

//	簡單的Spring Mail
	@GetMapping("B/sendEmail")
	@ResponseBody
	public String sendSimpleMail() {
		try {
			mailservice.sendSimpleMail();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Mail";
	}

//	簡單的Spring Mail + 有html附檔
	@GetMapping("B/sendAttachEmail")
	@ResponseBody
	public String sendAttachMail() {
		try {
			mailservice.sendAttachMail();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Attachment Mail";
	}
}
