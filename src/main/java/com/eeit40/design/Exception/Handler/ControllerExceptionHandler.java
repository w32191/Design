package com.eeit40.design.Exception.Handler;

import com.eeit40.design.Exception.ActivityException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

// 接住Controller 發出的Exception
@ControllerAdvice
@Slf4j
public class ControllerExceptionHandler {

  @ExceptionHandler(ActivityException.class)
  public ModelAndView handle(ActivityException e) {
    ModelAndView mav = new ModelAndView();
    log.error("接到ActivityException!!：" + e.getMessage());
    mav.addObject("errorMessageStr", e.getMessage());
    mav.setViewName("error");
    return mav;
  }

  // SamWang to-do: HttpClientErrorException尚未處理


}
