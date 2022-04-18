package com.eeit40.design.Dto;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import org.springframework.lang.Nullable;


public class ActivityDto implements Serializable {

  private Integer id;
  private String subject;
  private String content;
  private Integer discountPercentage;
  private LocalDate startDate;
  private LocalDate endDate;
  private Map<String, byte[]> imgs; // <fileName,fileByte[]>
  private List<Integer> productId;

  public ActivityDto() {
  }

  public ActivityDto(
      @Nullable Integer id, String subject, String content, Integer discountPercentage,
      LocalDate startDate, LocalDate endDate, @Nullable Map<String, byte[]> imgs,
      @Nullable List<Integer> productId) {
    this.id = id;
    this.subject = subject;
    this.content = content;
    this.discountPercentage = discountPercentage;
    this.startDate = startDate;
    this.endDate = endDate;
    this.imgs = imgs;
    this.productId = productId;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Integer getDiscountPercentage() {
    return discountPercentage;
  }

  public void setDiscountPercentage(Integer discountPercentage) {
    this.discountPercentage = discountPercentage;
  }

  public LocalDate getStartDate() {
    return startDate;
  }

  public void setStartDate(LocalDate startDate) {
    this.startDate = startDate;
  }

  public LocalDate getEndDate() {
    return endDate;
  }

  public void setEndDate(LocalDate endDate) {
    this.endDate = endDate;
  }

  public Map<String, byte[]> getImgs() {
    return imgs;
  }

  public void setImgs(Map<String, byte[]> imgs) {
    this.imgs = imgs;
  }

  public List<Integer> getProductId() {
    return productId;
  }

  public void setProductId(List<Integer> productId) {
    this.productId = productId;
  }
}
