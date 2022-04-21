package com.eeit40.design.Exception.Handler;

import com.eeit40.design.Exception.ActivityException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

// 接住Controller 發出的Exception
@ControllerAdvice(annotations = {Controller.class, RestControllerAdvice.class})
public class ControllerExceptionHandler {

  private final Logger log = LoggerFactory.getLogger(this.getClass());


  @ExceptionHandler(ActivityException.class)
  public ModelAndView handle(ActivityException e) {
    ModelAndView mav = new ModelAndView();
    log.error("接到Exception:ActivityException!!：" + e.getMessage());
    mav.addObject("errorMessage", e.getMessage());
    mav.setViewName("/error");
    return mav;
  }
}
