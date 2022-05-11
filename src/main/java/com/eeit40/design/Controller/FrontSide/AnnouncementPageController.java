package com.eeit40.design.Controller.FrontSide;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.AnnouncementWorkMessages;
import com.eeit40.design.Service.AnnouncementWorkMessagesService;


@Controller("FrontAnnouncementPageController")
public class AnnouncementPageController {
	
	@Autowired
	private AnnouncementWorkMessagesService messageService;

	

	@GetMapping("/F/Announcement/viewMessages")
	             
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		System.out.println("pageNumber=" + pageNumber);
		Page<AnnouncementWorkMessages> page = messageService.findByPage(pageNumber);
	    System.out.println(page.getContent());	
		mav.getModel().put("page", page);
		mav.setViewName("/F/Announcement/announcement");
		
		return mav;
	}

	
	
}
