package com.eeit40.design.Controller.BackSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("BackUniversalPageController")
public class UniversalPageController {

    @GetMapping("/B/Activity")
    public String activityPage() {
        return "redirect:/B/Activity/findAll";
    }

    @GetMapping("/B/CasePage")
    public String CasePage() {
        return "redirect:/B/Case";
    }

    @GetMapping("/B/")
    public String login(){
        return "redirect:/B/login";
    }


}
