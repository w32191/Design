package com.eeit40.design.Entity;

import java.time.Instant;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "announcement")
public class Announcement {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @Lob
  @Column(name = "content")
  private String content;

  @Column(name = "release_time")
  private Instant releaseTime;

  public Announcement() {
  }

  public Instant getReleaseTime() {
    return releaseTime;
  }

  public void setReleaseTime(Instant releaseTime) {
    this.releaseTime = releaseTime;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }
}
