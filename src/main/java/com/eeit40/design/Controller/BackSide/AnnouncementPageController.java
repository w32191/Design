package com.eeit40.design.Controller.BackSide;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.AnnouncementWorkMessages;
import com.eeit40.design.Service.AnnouncementWorkMessagesService;


@Controller
public class AnnouncementPageController {
	
	@Autowired
	private AnnouncementWorkMessagesService messageService;
	
	@GetMapping("/")
	public String welcomIndex() {
		return "messageIndex";
	}
	
	@GetMapping("/B/Announcement/message/addMessage")
	public ModelAndView addMessagePage(ModelAndView mav) {
		
		AnnouncementWorkMessages message = new AnnouncementWorkMessages();
		mav.getModel().put("announcementWorkMessages", message);
		
		AnnouncementWorkMessages lastMag = messageService.getLastest();
		mav.getModel().put("lastMessage", lastMag);
		
        mav.setViewName("B/Announcement/addMessage");
		return mav;
	}
	
	@GetMapping("/B/Announcement/message/viewMessages")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<AnnouncementWorkMessages> page = messageService.findByPage(pageNumber);
		System.out.println(page.getContent());
		mav.getModel().put("page", page);
		mav.setViewName("B/Announcement/viewMessages");
		
		return mav;
	}

}
