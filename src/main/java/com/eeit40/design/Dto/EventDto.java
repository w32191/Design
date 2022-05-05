package com.eeit40.design.Dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class EventDto {

  private Integer id;

  private String title;

  private LocalDate start;

  private LocalDate end;

  private String backgroundColor;

  public EventDto(Integer id, String title, LocalDate startDate, LocalDate endDate) {
    this.id = id;
    this.title = title;
    this.start = startDate;
    this.end = endDate;
  }
}
