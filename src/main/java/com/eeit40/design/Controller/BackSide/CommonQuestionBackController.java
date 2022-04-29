package com.eeit40.design.Controller.BackSide;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.eeit40.design.Entity.CommonQuestion;
import com.eeit40.design.Entity.CommonQuestionType;
import com.eeit40.design.Service.CommonQuestionService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CommonQuestionBackController {

  @Autowired
  private CommonQuestionService cqsService;

  // JustForTest
  @GetMapping("/B/CommonQuestionCopy")
  public ModelAndView selectAllQuestiontest(ModelAndView mav) {
    List<CommonQuestion> cq = cqsService.selectAll();
    mav.addObject("cqs", cq);
    List<CommonQuestionType> cqt = cqsService.findAllQuestionTypes();
    mav.addObject("cqts", cqt);
    mav.setViewName("/B/CommonQuestion/CommonQuestion");
    return mav;
  }

  // 後台顯示全QA
  @GetMapping("/B/CommonQuestion")
  public ModelAndView selectAllQuestion(ModelAndView mav) {
    List<CommonQuestion> cq = cqsService.selectAll();
    mav.addObject("cqs", cq);
    List<CommonQuestionType> cqt = cqsService.findAllQuestionTypes();
    mav.addObject("cqts", cqt);
    mav.setViewName("/B/CommonQuestion/CommonQuestion");
    return mav;
  }


  // 刪除
  @GetMapping("/B/CommonQuestion/deleteQuestion")
  public ModelAndView deleteQuestion(ModelAndView mav, @RequestParam(name = "id") Integer id) {
    cqsService.deleteQA(id);
    mav.setViewName("redirect:/B/CommonQuestion");
    return mav;
  }

//  // 顯示QA彈窗後的內容
//  @ResponseBody
//  @GetMapping("/B/CommonQuestion/updateQuestion")
//  public CommonQuestion findQuestionByID(@RequestParam(name = "id") Integer id) {
//    return cqsService.findById(id);
//  }

  // 把更新QA送出
  @PostMapping("/B/CommonQuestion/updateQuestionContent")
  @ResponseBody
  public String updateCommonQuestionContent(
      @RequestParam(value = "question_type") String qty,
      @RequestParam(value = "question") String qt, 
      @RequestParam(value = "answer") String as,
      @RequestParam(value = "id") Integer id) {
    log.info(id+" "+qty+" "+qt+" "+as);
    cqsService.updateCommonQuestion(id, qty, qt, as);
    
    return "success";
  }

  // 新增QA
  @PostMapping("/B/CommonQuestion/insertCommonQuestion")
  @ResponseBody
  public String insertCommonQuestion(
      @RequestParam("question_type") String qty,
      @RequestParam("question") String qt, 
      @RequestParam("answer") String as) {

    CommonQuestion cq = new CommonQuestion();
    CommonQuestionType cqt = new CommonQuestionType();
    
    cqt.setId(Integer.valueOf(qty));
    log.info(as);
    cq.setQuestionType(cqt);
    cq.setQuestion(qt);
    cq.setAnswer(as);

    
    cqsService.insert(cq);
    
    return "success";
  }


}
