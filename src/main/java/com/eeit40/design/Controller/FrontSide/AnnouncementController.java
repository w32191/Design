package com.eeit40.design.Controller.FrontSide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.AnnouncementDto;
import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.AnnouncementWorkMessages;
import com.eeit40.design.Service.ActivityService;
import com.eeit40.design.Service.AnnouncementWorkMessagesService;

import lombok.extern.slf4j.Slf4j;

@Controller
public class AnnouncementController {
	@Autowired 
	private AnnouncementWorkMessagesService messageService;
	

	@GetMapping("/F/Announcement/")
	public ModelAndView announcement(ModelAndView mav) {
		
		List<AnnouncementWorkMessages> allMessages = messageService.findAllMessages();
			
	
		
		
		mav.setViewName("/F/Announcement/announcement");
		return mav;
	}
	
	@PostMapping("/F/api/postMessage")
	@ResponseBody
	public List<AnnouncementWorkMessages> postMessageApi(@RequestBody AnnouncementDto dto){
		String content = dto.getMsg();
		
		AnnouncementWorkMessages workMsg = new AnnouncementWorkMessages();
		workMsg.setContent(content);
		messageService.insert(workMsg);
		
		Page<AnnouncementWorkMessages> page = (Page<AnnouncementWorkMessages>) messageService.findByPage(1);
		List<AnnouncementWorkMessages> list = page.getContent();
		
		
		return list;
	}
	
	
}
