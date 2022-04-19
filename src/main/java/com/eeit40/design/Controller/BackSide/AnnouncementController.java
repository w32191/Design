package com.eeit40.design.Controller.BackSide;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.Announcement;
import com.eeit40.design.Service.AnnouncementService;


@Controller
public class AnnouncementController {
	
	@Autowired
	private AnnouncementService announcementService;
	
	@PostMapping("/B/Announcement/message/add")
	public ModelAndView addMessage(ModelAndView mav,@Valid @ModelAttribute(name="Announcement") Announcement anct, BindingResult br) {
		
		if(!br.hasErrors()) {
			announcementService.insert(anct);
			Announcement newAnct = new Announcement();
			mav.getModel().put("announcement", newAnct);
		}
			
		Announcement latestAnct = announcementService.getLatest();
		mav.getModel().put("lastAnnouncement", latestAnct);
		mav.setViewName("addAnnouncement");
		
		return mav;
	}

}
