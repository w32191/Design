package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Dto.CaseDto;
import com.eeit40.design.Entity.Case;
import com.eeit40.design.Service.CaseService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
public class BackCasePageController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private Jackson2ObjectMapperBuilder builder;

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
    public ModelAndView findAllCases(ModelAndView modelAndView) {
        List<Case> list = caseService.findAllCases();
        System.out.println(list);
        modelAndView.addObject("findAll", list);
        modelAndView.setViewName("/B/Case/CaseMessage");
        return modelAndView;
    }

    //按"時間"尋找
    //1.Decs
    @GetMapping("/B/Case/CaseMessagedatetimeDesc")
    public ModelAndView findFirstByOrderByDateTimeDesc(ModelAndView modelAndView) {
        List<Case> list = caseService.findAllByOrderByDateTimeDesc();
        modelAndView.addObject("lastest", list);
        modelAndView.setViewName("/B/Case/CaseMessagedatetimeDesc");
        return modelAndView;
    }

    //2.Acs
    @GetMapping("/B/Case/CaseMessagedatetimeAsc")
    public ModelAndView findFirstByOrderByDateTimeAsc(ModelAndView modelAndView) {
        List<Case> list = caseService.findAllByOrderByDateTimeAsc();
        modelAndView.addObject("oldest", list);
        modelAndView.setViewName("/B/Case/CaseMessagedatetimeAsc");
        return modelAndView;
    }

    //按"類別"尋找
    @ResponseBody
    @GetMapping("/B/Case/orderByClassification")
    public String orderByClassification(@RequestParam("classification") String classification) throws JsonProcessingException {
        List<Case> list = caseService.orderByClassification(classification);
//        ObjectMapper mapper = builder.build();
//        modelAndView.addObject("orderByClassification",list);
//        modelAndView.setViewName("/B/Case/caseOrderByClassification");
//        System.out.println(mapper.writeValueAsString(list));
        return mapper.writeValueAsString(list);
    }

    //按"地區"尋找
    @ResponseBody
    @GetMapping("/B/Case/orderByLocation")
    public String orderByLocation(@RequestParam("location") String location) throws JsonProcessingException {
        List<Case> orderByLocationList = caseService.orderByLocation(location);
//
        ObjectMapper mapper = builder.build();
        return mapper.writeValueAsString(orderByLocationList);
    }

    //頁面
//    @GetMapping(value = "B/Case/page/{pageNumber}")
//    public List<Case> findByCasePage(@PathVariable Integer pageNumber){
//        Pageable pgb = PageRequest.of(pageNumber -1, 2, Sort.Direction.ASC,"id");
//        Page<Case> page = caseRepository.findAll(pgb);
//        List<Case> list = page.getContent();
//        return list;
//    }


    //編輯案例
//    public ModelAndView findById(ModelAndView modelAndView ,@PathVariable Integer id){
//        Case editCase = caseService.findById(id);
//    }

    //刪除
    @GetMapping("/B/Case/delete/{id}")
    @ResponseBody
    public String deleteCaseById(@PathVariable Integer id) {
        //測試用建議加入
        System.out.println(id);
        Integer r = caseService.deleteCaseById(id);
        System.out.println(r);
        //沒刪除為0
        //刪除為1

        if (r > 0) {
            return "刪除成功！";
        }
//        modelAndView.setViewName("redirect:/B/Case/CaseMessage");
        return "刪除失敗！";
    }

    //新增
    @PostMapping("/B/Case/api/postCase")
    @ResponseBody
    public List<Case> postCaseApi(@RequestParam("data") String dataStr) throws JsonProcessingException {
        log.info(dataStr);
        CaseDto caseDto = mapper.readValue(dataStr, CaseDto.class);
        // @RequestBody CaseDto caseDto
        String titleDto = caseDto.getTitleDto();
        String nameDto = caseDto.getNameDto();
        String classificationDto = caseDto.getClassificationDto();
        String locationDto = caseDto.getLocationDto();
        String caseEmailDto = caseDto.getCaseEmailDto();
        String messageDto = caseDto.getMessageDto();
        Date expiryDateDto = caseDto.getExpiryDateDto();

        Case caseMsg = new Case();
        caseMsg.setTitle(titleDto);
        caseMsg.setName(nameDto);
        caseMsg.setClassification(classificationDto);
        caseMsg.setLocation(locationDto);
        caseMsg.setCaseEmail(caseEmailDto);
        caseMsg.setMessage(messageDto);
        caseMsg.setExpiryDate(expiryDateDto);
        caseService.insert(caseMsg);

        Page<Case> page = caseService.findByPage(1);
        List<Case> list = page.getContent();

        return list;
    }
}
