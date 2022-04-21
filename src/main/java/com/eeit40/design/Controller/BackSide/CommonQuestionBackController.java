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
import com.eeit40.design.Service.CommonQuestionService;

@Controller
public class CommonQuestionBackController {

	@Autowired
	private CommonQuestionService cqsService;
	
	
	//後台顯示全QA
	@GetMapping("/B/CommonQuestion.html")
	  public ModelAndView selectAllQuestion(ModelAndView mav) {
		List<CommonQuestion> cq = cqsService.selectAll();
		mav.addObject("cqs", cq);		
		mav.setViewName("/B/CommonQuestion/CommonQuestion");		
	    return mav;
	}
	
	
	@PostMapping("/B/CommonQuestion/add")
    public ModelAndView addMessage(ModelAndView mav, @Valid @ModelAttribute(name = "CommonQuestion") CommonQuestion msg,
            BindingResult br) {

        if (!br.hasErrors()) {
            cqsService.insert(msg);
            CommonQuestion newMsg = new CommonQuestion();
            mav.getModel().put("CommonQuestion", newMsg);
        }
        return mav;
    }

    @GetMapping("/B/CommonQuestion/updateQuestion")
    public String updateQuestion(Model model, @RequestParam(name="id") Integer id) {

        CommonQuestion cq = cqsService.findById(id);
        model.addAttribute("commonQuestion", cq);
        
        return "updateQuestion";
    }
    
    @PostMapping("/B/CommonQuestion/updateQuestion")
    public ModelAndView updateQuestion(ModelAndView mav, @Valid @ModelAttribute(name="commonQuestion") CommonQuestion cq, BindingResult br) {
        
        mav.setViewName("updateQuestion");
        
        if(!br.hasErrors()) {
            https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
            cqsService.insert(cq); 
            mav.setViewName("redirect:/B/CommonQuestion.html");
        }
        
        return mav;
        
    }
	
	//刪除
	@GetMapping("/B/CommonQuestion/deleteQuestion")
    public ModelAndView deleteQuestion(ModelAndView mav, @RequestParam(name="id") Integer id) {
	  cqsService.deleteQA(id);        
      mav.setViewName("redirect:/B/CommonQuestion.html");//為什麼這邊後面需要加.html?
      return mav;
    }
    
    
	
	
	
	
}
