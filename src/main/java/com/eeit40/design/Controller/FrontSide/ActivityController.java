package com.eeit40.design.Controller.FrontSide;

import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Service.ActivityService;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("FrontActivityController")
@Slf4j
public class ActivityController {

  @Autowired
  private ActivityService activityService;

  @GetMapping("/F/Activity/index")
  public ModelAndView activityIndexPage(ModelAndView mav) {

    List<Activity> allActivity = activityService.findAll();

    mav.addObject("allActivity", allActivity);
    mav.setViewName("/F/Activity/Activity");
    return mav;
  }

}
