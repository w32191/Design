package com.eeit40.design.Controller.BackSide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.CommonQuestion;
import com.eeit40.design.Service.CommonQuestionService2;

@Controller
public class CommonQuestionBackController {

	@Autowired
	private CommonQuestionService2 cqsService;
	
	
	
	@GetMapping("/B/CommonQuestion.html")
	  public ModelAndView wishListPage2(ModelAndView mav) {
		List<CommonQuestion> cq = cqsService.selectAll();
		mav.addObject("cqs", cq);		
		mav.setViewName("/B/CommonQuestion/CommonQuestion");
		
	    return mav;
	  }
	
	
	
	
	
	
}
