package com.eeit40.design.Controller.FrontSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("FrontUniversalPageController")
public class UniversalPageController {

  @GetMapping("/F/")
  public String activityPage() {
    return "redirect:/F/Activity/index";
  }
}
