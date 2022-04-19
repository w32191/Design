package com.eeit40.design.Controller.FrontSide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class InsertAccountColltroller {

	  @GetMapping("F/register/add")
	  public String registerPage() {
		  
	    return "register";
	  }
}
