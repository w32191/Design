package com.eeit40.design.Controller.BackSide;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.AnnouncementWorkMessages;
import com.eeit40.design.Service.AnnouncementWorkMessagesService;


@Controller
public class AnnouncementMessageController {
	
	@Autowired
	private AnnouncementWorkMessagesService messageService;
	
	@PostMapping("/B/Announcement/add")
	public ModelAndView addMessage(ModelAndView mav,@Valid @ModelAttribute(name="announcementWorkMessages") AnnouncementWorkMessages msg, BindingResult br) {

		
		
		if(!br.hasErrors()) {
			System.out.println(msg.getContent());
			messageService.insert(msg);
			AnnouncementWorkMessages newMsg = new AnnouncementWorkMessages();
			mav.getModel().put("announcementWorkMessages", newMsg);
		}
			
		AnnouncementWorkMessages latestMsg = messageService.getLastest();
		mav.getModel().put("lastMessage", latestMsg);
		mav.setViewName("addMessage2");
		
		
		
		return mav;
	}

}
