package com.eeit40.design.Exception;

public class ActivityException extends RuntimeException {

  public ActivityException() {
  }

  public ActivityException(String message) {
    super(message);
  }

  public ActivityException(String message, Throwable cause) {
    super(message, cause);
  }

  public ActivityException(Throwable cause) {
    super(cause);
  }

  public ActivityException(String message, Throwable cause, boolean enableSuppression,
      boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }
}
