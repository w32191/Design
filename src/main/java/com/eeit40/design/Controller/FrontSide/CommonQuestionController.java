package com.eeit40.design.Controller.FrontSide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.CommonQuestion;
import com.eeit40.design.Service.CommonQuestionService;

@Controller
public class CommonQuestionController {

	@Autowired
	private CommonQuestionService cqsService;
	
	
	
	@GetMapping("/F/CommonQuestion")
	  public ModelAndView wishListPage2(ModelAndView mav) {
		List<CommonQuestion> cq = cqsService.selectAll();
		//mav.getModel().put("cqs", cq); 
		mav.addObject("cqs", cq); //addObject作用跟getModel().put()是一樣的
		mav.setViewName("/F/CommonQuestion/CommonQuestion");		
	    return mav;
	  }
	
	
	
	
}
