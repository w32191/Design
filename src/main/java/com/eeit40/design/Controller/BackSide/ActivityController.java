package com.eeit40.design.Controller.BackSide;


import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Exception.ActivityException;
import com.eeit40.design.Service.ActivityService;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("BackActivityController")
@Slf4j
public class ActivityController { // 用來跳轉頁面用的controller


  @Autowired
  private ActivityService service;

  // 活動全部資料table
  @GetMapping("/B/Activity/findAll")
  public ModelAndView findAll(ModelAndView modelAndView,
      @RequestParam(name = "page", defaultValue = "1") String page) {
    Page<Activity> list = service.findByPage(Integer.valueOf(page));
//    List<Activity> list = service.findAll();
    modelAndView.addObject("activities", list);
    modelAndView.setViewName("/B/Activity/Activity");

    return modelAndView;
  }

  // 編輯活動
  @GetMapping("/B/Activity/editActivity/{id}")
  public ModelAndView findById(ModelAndView mav, @PathVariable Integer id) {
    Activity editActivity = service.findById(id);
    if (editActivity == null) {
      throw new ActivityException("沒有找到該筆活動！！");
    }

    mav.addObject("activity", editActivity);
    mav.setViewName("/B/Activity/EditActivity");
    return mav;
  }

  @GetMapping("/B/Activity/Calendar")
  public ModelAndView calendarPage(ModelAndView mav) {
    mav.setViewName("/B/Activity/ActivityCalendar");
    return mav;
  }

}
