package com.eeit40.design.Controller.BackSide;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eeit40.design.Entity.CommonQuestion;
import com.eeit40.design.Service.CommonQuestionService;

@Controller
public class CommonQuestionBackController {

	@Autowired
	private CommonQuestionService cqsService;
	
	
	
	@GetMapping("/B/CommonQuestion.html")
	  public ModelAndView wishListPage2(ModelAndView mav) {
		List<CommonQuestion> cq = cqsService.selectAll();
		mav.addObject("cqs", cq);		
		mav.setViewName("/B/CommonQuestion/CommonQuestion");		
	    return mav;
	}
	
	// 修改
    @PostMapping("/B/CommonQuestion/editQuestion")
    public ModelAndView productfindByName(ModelAndView mav, @RequestParam(name = "pID_e") int pID,
            @RequestParam(name = "pName_e") String pName, @RequestParam(name = "pPrice_e") int pPrice,
            @RequestParam(name = "pSpecs_e") String pSpecs, @RequestParam(name = "pType_e") int pType, 
            @RequestParam(name = "pCountry_e") int pCountry, @RequestParam(name = "pAvailable_e") String pAvailable, 
            @RequestParam(name = "pDes_e") String pDes, @RequestParam(name = "pPic_e") Part part) {
      cqsService.updateQuestion(pName, pPrice, pSpecs, pDes, pType, pCountry, pAvailable, pID, part);
        mav.setViewName("redirect:/admin/product");
        return mav;

    }
	
	// 刪除(ajax)
    @ResponseBody
    @DeleteMapping("/B/CommonQuestion/deleteQuestion/{id}")
    public HashMap<String, Object> questionDelete(@PathVariable(name = "id") int id) {
      cqsService.deleteById(id);
        return null;
    }
	
	
	
	
}
