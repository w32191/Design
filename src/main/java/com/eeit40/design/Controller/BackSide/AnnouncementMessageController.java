package com.eeit40.design.Controller.BackSide;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Dto.AnnouncementDto;
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
		mav.setViewName("redirect:/B/Announcement/viewMessages");
		
		
		
		return mav;
	}



@GetMapping("/B/Announcement/editMessage")
public String editMessage(Model model, @RequestParam(name="id") Integer id) {

	AnnouncementWorkMessages msg = messageService.findById(id);
	model.addAttribute("announcementWorkMessages", msg);
	
	return "/B/Announcement/editMessage";
}

@PostMapping("/B/Announcement/editMessage")
public ModelAndView editMessage(ModelAndView mav, @Valid @ModelAttribute(name="announcementWorkMessage") AnnouncementWorkMessages msg, BindingResult br) {
	
	mav.setViewName("editMessage");
	
	if(!br.hasErrors()) {
		https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
		messageService.insert(msg);
		mav.setViewName("redirect:/B/Announcement/viewMessages");
	}
	
	return mav;
	
}

@GetMapping("/B/Announcement/deleteMessage")
public ModelAndView deleteMessage(ModelAndView mav, @RequestParam(name="id") Integer id) {
	messageService.deleteById(id);
	
	mav.setViewName("redirect:/B/Announcement/viewMessages");
	
	return mav;
}

@PostMapping("/api/postMessage")
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
