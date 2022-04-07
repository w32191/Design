package com.eeit40.design.Entity;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "design_review")
public class DesignReview {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @Column(name = "comment_date")
  private LocalDate commentDate;

  @Column(name = "star")
  private Integer star;

  @Lob
  @Column(name = "comment")
  private String comment;

  @Column(name = "score")
  private Integer score;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_design_service_id")
  private DesignService fkDesignService;

  public DesignReview() {
  }

  public DesignService getFkDesignService() {
    return fkDesignService;
  }

  public void setFkDesignService(DesignService fkDesignService) {
    this.fkDesignService = fkDesignService;
  }

  public Integer getScore() {
    return score;
  }

  public void setScore(Integer score) {
    this.score = score;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public Integer getStar() {
    return star;
  }

  public void setStar(Integer star) {
    this.star = star;
  }

  public LocalDate getCommentDate() {
    return commentDate;
  }

  public void setCommentDate(LocalDate commentDate) {
    this.commentDate = commentDate;
  }

  public Member getFkMember() {
    return fkMember;
  }

  public void setFkMember(Member fkMember) {
    this.fkMember = fkMember;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

}
