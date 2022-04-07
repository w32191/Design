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
@Table(name = "product_review")
public class ProductReview {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_product_id")
  private Product fkProduct;

  @Column(name = "comment_date")
  private LocalDate commentDate;

  @Column(name = "star")
  private Integer star;

  @Lob
  @Column(name = "comment")
  private String comment;

  @Column(name = "score")
  private Integer score;

  public ProductReview() {
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

  public Product getFkProduct() {
    return fkProduct;
  }

  public void setFkProduct(Product fkProduct) {
    this.fkProduct = fkProduct;
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
