package com.eeit40.design.Controller.FrontSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnnouncementController {

	@GetMapping("/F/Announcement/")
	public ModelAndView index(ModelAndView mav) {
		
		
		
		mav.setViewName("/F/Announcement/announcement");
		return mav;
	}
	
}
