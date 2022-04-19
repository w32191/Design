package com.eeit40.design.Exception;

import java.nio.charset.Charset;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpClientErrorException;

public class ImgurException extends HttpClientErrorException {

  public ImgurException(HttpStatus statusCode) {
    super(statusCode);
  }

  public ImgurException(HttpStatus statusCode, String statusText) {
    super(statusCode, statusText);
  }

  public ImgurException(HttpStatus statusCode, String statusText, byte[] body,
      Charset responseCharset) {
    super(statusCode, statusText, body, responseCharset);
  }

  public ImgurException(HttpStatus statusCode, String statusText,
      HttpHeaders headers, byte[] body,
      Charset responseCharset) {
    super(statusCode, statusText, headers, body, responseCharset);
  }

  public ImgurException(String message, HttpStatus statusCode, String statusText,
      HttpHeaders headers, byte[] body, Charset responseCharset) {
    super(message, statusCode, statusText, headers, body, responseCharset);
  }
}
