package com.eeit40.design.Exception.Handler;

import com.eeit40.design.Controller.BackSide.ActivityController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;

@ControllerAdvice(annotations = {Controller.class, RestController.class})
public class ImgurExceptionHandler {

  private final Logger log = LoggerFactory.getLogger(this.getClass());

  @Autowired
  private Jackson2ObjectMapperBuilder builder;

  @ExceptionHandler(HttpClientErrorException.class)
  public ResponseEntity<String> handle(HttpClientErrorException exception)
      throws JsonProcessingException {
    // Imgur 上傳檔案時，檔案格式不符合的話
    ObjectMapper mapper = builder.build();
    JsonNode res = mapper.readTree(exception.getResponseBodyAsString());

    HttpHeaders headers = new HttpHeaders();
    headers.add("Location", "/Error");
    // SamWang To-Do: ERROR Page 未完成
    return ResponseEntity.status(res.get("status").asInt()).headers(headers)
        .body("Error:" + res.get("data").get("error").asText());
  }

}