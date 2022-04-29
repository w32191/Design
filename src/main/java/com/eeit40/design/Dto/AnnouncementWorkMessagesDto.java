package com.eeit40.design.Dto;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import org.springframework.lang.Nullable;


public class AnnouncementDto implements Serializable {

  private Integer id;
  private String content; 
  private LocalDate releaseTime;
  private Map<String, byte[]> imgs; // <fileName,fileByte[]>
  private List<Integer> Id;

  public AnnouncementDto() {
  }

  public AnnouncementDto(
      @Nullable Integer id, String content, LocalDate releaseTime){
    this.id = id;
    this.content = content;
    this.releaseTime = releaseTime;  
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public LocalDate getReleaseTime() {
    return releaseTime;
  }

  public void setReleaseTime(LocalDate releaseTime) {
    this.releaseTime = releaseTime;
  }

}
