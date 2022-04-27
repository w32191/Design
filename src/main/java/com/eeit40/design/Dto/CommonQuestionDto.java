package com.eeit40.design.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class CommonQuestionDto implements Serializable {

  private static final long serialVersionUID = 1L;
  
  @JsonProperty("classificationDto")
  private String classificationDto;
  
  @JsonProperty("titleDto")
  private String titleDto;
  
  @JsonProperty("answerDto")
  private String answerDto;

  public CommonQuestionDto() {
  }

  public CommonQuestionDto(String classificationDto, String titleDto, String answerDto) {
    this.classificationDto = classificationDto;
    this.titleDto = titleDto;
    this.answerDto = answerDto;
  }

  public String getClassificationDto() {
    return classificationDto;
  }

  public void setClassificationDto(String classificationDto) {
    this.classificationDto = classificationDto;
  }

  public String getTitleDto() {
    return titleDto;
  }

  public void setTitleDto(String titleDto) {
    this.titleDto = titleDto;
  }

  public String getAnswerDto() {
    return answerDto;
  }

  public void setAnswerDto(String answerDto) {
    this.answerDto = answerDto;
  }
  
   
}
