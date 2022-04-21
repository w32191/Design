package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Exception.ActivityException;
import com.eeit40.design.Service.ActivityService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActivityController {

  private final Logger log = LoggerFactory.getLogger(this.getClass());

  @Autowired
  private ActivityService service;

  @Autowired
  private ObjectMapper objectMapper;

  // 活動全部資料table
  @GetMapping("/B/Activity/findAll")
  public ModelAndView findAll(ModelAndView modelAndView) {
    List<Activity> list = service.findAll();
    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");
    return modelAndView;
  }

  // 編輯活動
  @GetMapping("/B/Activity/find/{id}")
  public ModelAndView findById(ModelAndView mav, @PathVariable Integer id) {
    Activity editActivity = service.findById(id);
    if (editActivity == null) {
      throw new ActivityException("沒有找到該筆活動！！");
    }
    mav.addObject("activity", service.findById(id));
    mav.setViewName("/B/Activity/EditActivity");
    return mav;
  }



}
