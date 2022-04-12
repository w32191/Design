package com.eeit40.design.Controller.BackSide;

import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Service.ActivityService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActivityController {

  @Autowired
  private ActivityService service;

  @GetMapping("/B/Activity/findAll")
  public ModelAndView findAll(ModelAndView modelAndView) {
    List<Activity> list = service.findAll();

    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");
    return modelAndView;
  }

}
