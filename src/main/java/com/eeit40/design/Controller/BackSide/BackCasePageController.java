package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BackCasePageController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CaseService caseService;

//    @GetMapping("/B/CaseMessage")
//    public ModelAndView caseMessage(ModelAndView mav , @RequestParam(name="page",defaultValue = "1") Integer pageNumber){
//        Page<Case> page = caseService.findByPage(pageNumber);
//        mav.getModel().put("page",page);
//
//        Case lastestCase = caseService.getLastest();
//        mav.getModel().put("lastCase",lastestCase);
//
//        mav.setViewName("/B/Case/CaseMessage");
//        return mav;
//    }

    //列出全部資料
    @GetMapping("/B/Case/CaseMessage")
    public ModelAndView findAllCases(ModelAndView modelAndView){
        List<Case> list = caseService.findAllCases();
        modelAndView.addObject("findAll",list);
        modelAndView.setViewName("/B/Case/CaseMessage");
        return modelAndView;
    }
    //按"時間"尋找
    //1.Decs
    @GetMapping("/B/Case/CaseMessagedatetimeDesc")
    public ModelAndView findFirstByOrderByDateTimeDesc(ModelAndView modelAndView){
        List<Case> list = caseService.findAllByOrderByDateTimeDesc();
        modelAndView.addObject("lastest",list);
        modelAndView.setViewName("/B/Case/CaseMessagedatetimeDesc");
        return modelAndView;
    }
    //2.Acs
    @GetMapping("/B/Case/CaseMessagedatetimeAsc")
    public ModelAndView findFirstByOrderByDateTimeAsc(ModelAndView modelAndView){
        List<Case> list = caseService.findAllByOrderByDateTimeAsc();
        modelAndView.addObject("oldest",list);
        modelAndView.setViewName("/B/Case/CaseMessagedatetimeAsc");
        return modelAndView;
    }
}
