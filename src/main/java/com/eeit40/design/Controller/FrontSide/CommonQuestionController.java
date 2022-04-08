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
	
	
	
	@GetMapping("FrontSide/test.html")
	  public ModelAndView wishListPage2(ModelAndView mav) {
		List<CommonQuestion> cq = cqsService.selectAll();
		mav.getModel().put("cqs", cq);
		
		mav.setViewName("/FrontSide/MillerPage/test");
		
	    return mav;
	  }
	
	
	
	
}
