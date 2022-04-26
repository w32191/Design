package com.eeit40.design.Dto;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;

@NoArgsConstructor
@Data
public class ActivityDto implements Serializable {

  private Integer id;
  private String subject;
  private String content;
  private Integer discountPercentage;
  private LocalDate startDate;
  private LocalDate endDate;
  private Map<String, byte[]> insertImg; // <fileName,fileByte[]>
  private List<Integer> productId;


  public ActivityDto(
      @Nullable Integer id, String subject, String content, Integer discountPercentage,
      LocalDate startDate, LocalDate endDate, @Nullable Map<String, byte[]> insertImg,
      @Nullable List<Integer> productId) {
    this.id = id;
    this.subject = subject;
    this.content = content;
    this.discountPercentage = discountPercentage;
    this.startDate = startDate;
    this.endDate = endDate;
    this.insertImg = insertImg;
    this.productId = productId;
  }
}
