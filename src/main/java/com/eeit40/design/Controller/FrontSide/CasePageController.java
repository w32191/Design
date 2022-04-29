package com.eeit40.design.Controller.FrontSide;


import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CasePageController {

    @Autowired
    private CaseService caseService;

//    @GetMapping("/F/case")
//    public ModelAndView casePage(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//        Page<Case> page = caseService.findByPage(pageNumber);
//        mav.getModel().put("page", page);
//
//        List<Case> latestCase = caseService.findAllByOrderByDateTimeDesc();
//        mav.getModel().put("lastCase", latestCase);
//
//        mav.setViewName("/F/Case/case");
//        return mav;
//    }


//    @GetMapping("/F/viewCase")
//    public String viewCase() {
//
//        return "/F/Case/viewCase";
//
//    }
//
//    @GetMapping("/F/api/postCaseMessageApi")
//    @ResponseBody
//    public List<Case> postCaseApi(@RequestBody CaseDto caseDto){
//        String text = caseDto.getTitleDto();
//
//        Case caseMsg = new Case();
//        caseMsg.setTitle(text);
//        caseService.insert(caseMsg);
//
//        Page<Case> page = caseService.findByPage(1);
//        List<Case> list = page.getContent();
//
//        return list;
//    }
//

}
