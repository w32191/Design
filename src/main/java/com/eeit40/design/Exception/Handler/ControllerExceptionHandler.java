package com.eeit40.design.Exception.Handler;

import com.eeit40.design.Exception.ActivityException;
import com.eeit40.design.Exception.NullInputException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

// 接住Controller 發出的Exception
@ControllerAdvice
@Slf4j
public class ControllerExceptionHandler {

  @Autowired
  private ObjectMapper mapper;

  // 轉到錯誤畫面
  @ExceptionHandler(ActivityException.class)
  public ModelAndView handle(ActivityException e) {
    ModelAndView mav = new ModelAndView();
    log.error("接到ActivityException!!：" + e.getMessage());
    mav.addObject("errorMessageStr", e.getMessage());
    mav.setViewName("error");
    return mav;
  }

  // Imgur API 回傳Error時
  @ExceptionHandler(HttpClientErrorException.class)
  public ResponseEntity<String> handle(HttpClientErrorException exception)
      throws JsonProcessingException {
    // 讀取API回傳的response body
    JsonNode res = mapper.readTree(exception.getResponseBodyAsString());

    return ResponseEntity.status(res.get("status").asInt())
        .body("Error:" + res.get("data").get("error").asText());
  }

  @ExceptionHandler(NullInputException.class)
  public ResponseEntity<String> handle(NullInputException exception) {

    return ResponseEntity.status(400).body(exception.getMessage());
  }


}
