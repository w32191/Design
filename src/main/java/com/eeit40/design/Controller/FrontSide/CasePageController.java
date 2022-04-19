package com.eeit40.design.Controller.FrontSide;


import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CasePageController {

    @Autowired
    private CaseService caseService;

    @GetMapping("/F/case")
    public ModelAndView casePage(ModelAndView mav ,@RequestParam(name = "p",defaultValue = "1") Integer pageNumber){
        Page<Case> page = caseService.findByPage(pageNumber);
        mav.getModel().put("page",page);

        Case latestCase = caseService.getLastest();
        mav.getModel().put("lastCase",latestCase);

        mav.setViewName("/F/Case/case");
        return mav;
    }

    @GetMapping("/F/viewCase")
    public String viewCase(){

        return "/F/Case/viewCase";

    }
}
