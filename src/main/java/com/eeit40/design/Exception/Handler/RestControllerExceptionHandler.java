package com.eeit40.design.Exception.Handler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.HttpClientErrorException;

// 接住RestController 發出的Exception
@RestControllerAdvice
@Slf4j
public class RestControllerExceptionHandler {


  @Autowired
  private ObjectMapper mapper;

  // Imgur API 回傳Error時
  @ExceptionHandler(HttpClientErrorException.class)
  public ResponseEntity<String> handle(HttpClientErrorException exception)
      throws JsonProcessingException {
    // 讀取API回傳的response body
    JsonNode res = mapper.readTree(exception.getResponseBodyAsString());

    return ResponseEntity.status(res.get("status").asInt())
        .body("Error:" + res.get("data").get("error").asText());
  }

}
