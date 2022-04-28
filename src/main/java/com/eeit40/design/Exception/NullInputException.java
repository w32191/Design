package com.eeit40.design.Exception;

public class NullInputException extends RuntimeException {

  public NullInputException() {
  }

  public NullInputException(String message) {
    super(message);
  }

  public NullInputException(String message, Throwable cause) {
    super(message, cause);
  }

  public NullInputException(Throwable cause) {
    super(cause);
  }

  public NullInputException(String message, Throwable cause, boolean enableSuppression,
      boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }
}
