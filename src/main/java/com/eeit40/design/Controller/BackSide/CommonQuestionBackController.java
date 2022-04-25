package com.eeit40.design.Controller.BackSide;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.eeit40.design.Entity.CommonQuestion;
import com.eeit40.design.Entity.CommonQuestionType;
import com.eeit40.design.Service.CommonQuestionService;

@Controller
public class CommonQuestionBackController {

	@Autowired
	private CommonQuestionService cqsService;
	
	
	//後台顯示全QA
	@GetMapping("/B/CommonQuestion")
	  public ModelAndView selectAllQuestion(ModelAndView mav) {
		List<CommonQuestion> cq = cqsService.selectAll();
		mav.addObject("cqs", cq);		
		List<CommonQuestionType> cqt = cqsService.findAllQuestionTypes();
		mav.addObject("cqts", cqt);
		mav.setViewName("/B/CommonQuestion/CommonQuestion");		
	    return mav;
	}
	
	
	

	
	//刪除
	@GetMapping("/B/CommonQuestion/deleteQuestion")
    public ModelAndView deleteQuestion(ModelAndView mav, @RequestParam(name="id") Integer id) {
	  cqsService.deleteQA(id);        
      mav.setViewName("redirect:/B/CommonQuestion");
      return mav;
    }
    
	//顯示QA彈窗後的內容
    @ResponseBody
    @GetMapping("/B/CommonQuestion/updateQuestion")
    public CommonQuestion findQuestionByID(@RequestParam(name = "id") Integer id) {
        return cqsService.findById(id);
    }
    
    //把更新QA送出
    @PostMapping("/B/CommonQuestion/updateQuestionContent")
    public ModelAndView updateMessage(ModelAndView mav, 
        @RequestParam(value = "question_type") String qty,
        @RequestParam(value = "question") String qt,
        @RequestParam(value = "answer") String as,
        @RequestParam(value = "id") Integer id
        ) {
      cqsService.updateCommonQuestion(id, qty, qt, as);
      mav.setViewName("redirect:/B/CommonQuestion");        
      return mav;
    }
	
	
    
    
	
	
}
