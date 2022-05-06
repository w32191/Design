package com.eeit40.design.Dto;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import org.springframework.lang.Nullable;

import com.fasterxml.jackson.annotation.JsonProperty;


public class AnnouncementDto implements Serializable {
	
  private static final long SerializableUID = 1L;
  @JsonProperty("message")
  private String msg;
  
  private Integer id;
  private String content; 
  private Date added;
//  private Map<String, byte[]> imgs; // <fileName,fileByte[]>
//  private List<Integer> Id;

  public AnnouncementDto() {
  }

  public AnnouncementDto(
      @Nullable Integer id, String content, Date added){
    this.id = id;
    this.content = content;
    this.added = added;  
  
  }

  public String getMsg() {
	  return msg;
  }
  
  public void setMsg(String msg) {
	  this.msg = msg;
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


  public Date getAdded() {
    return added;
  }

  public void setAdded(Date added) {
    this.added = added;
  }

}
