package com.eeit40.design.Dto;

import com.eeit40.design.Entity.ImgurImg;
import com.eeit40.design.Entity.Product;
import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.springframework.util.Base64Utils;

public class ActivityDto implements Serializable {

  private Integer id;
  private String subject;
  private String content;
  private Integer discountPercentage;
  private LocalDateTime startDate;
  private LocalDateTime endDate;
  private String imgBase64Str;
  private List<Integer> productIdList;
  private Set<ImgurImg> imgs;

  public ActivityDto() {
  }

  public ActivityDto(Integer id, String subject, String content, Integer discountPercentage,
      LocalDateTime startDate, LocalDateTime endDate, Set<ImgurImg> imgs, Set<Product> products) {
    this.id = id;
    this.subject = subject;
    this.content = content;
    this.discountPercentage = discountPercentage;
    this.startDate = startDate;
    this.endDate = endDate;
    this.imgs = imgs;

    List<Integer> productsId = new ArrayList<>();
    for (Product product : products) {
      productsId.add(product.getId());
    }
    this.productIdList = productsId;
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

  public LocalDateTime getStartDate() {
    return startDate;
  }

  public void setStartDate(LocalDateTime startDate) {
    this.startDate = startDate;
  }

  public LocalDateTime getEndDate() {
    return endDate;
  }

  public void setEndDate(LocalDateTime endDate) {
    this.endDate = endDate;
  }

  public String getImgBase64Str() {
    return imgBase64Str;
  }

  public void setImgBase64Str(byte[] photo) {
    this.imgBase64Str = Base64Utils.encodeToString(photo);
  }

  public List<Integer> getProductIdList() {
    return productIdList;
  }

  public void setProductIdList(Set<Product> products) {
    List<Integer> productsId = new ArrayList<>();
    for (Product product : products) {
      productsId.add(product.getId());
    }
    this.productIdList = productsId;
  }

  public Set<ImgurImg> getImgs() {
    return imgs;
  }

  public void setImgs(Set<ImgurImg> imgs) {
    this.imgs = imgs;
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("ActivityDto{");
    sb.append("id=").append(id);
    sb.append(", subject='").append(subject).append('\'');
    sb.append(", content='").append(content).append('\'');
    sb.append(", discountPercentage=").append(discountPercentage);
    sb.append(", startDate=").append(startDate);
    sb.append(", endDate=").append(endDate);
    sb.append(", imgBase64Str='").append(imgBase64Str).append('\'');
    sb.append('}');
    return sb.toString();
  }
}
