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
@Table(name = "question")
public class Question {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_account_id")
  private Account fkAccount;

  @Column(name = "question_date")
  private LocalDate questionDate;

  @Column(name = "question_title", length = 100)
  private String questionTitle;

  @Lob
  @Column(name = "question_content")
  private String questionContent;

  @Column(name = "reply_date")
  private LocalDate replyDate;

  @Lob
  @Column(name = "reply_content")
  private String replyContent;

  public Question() {
  }

  public String getReplyContent() {
    return replyContent;
  }

  public void setReplyContent(String replyContent) {
    this.replyContent = replyContent;
  }

  public LocalDate getReplyDate() {
    return replyDate;
  }

  public void setReplyDate(LocalDate replyDate) {
    this.replyDate = replyDate;
  }

  public String getQuestionContent() {
    return questionContent;
  }

  public void setQuestionContent(String questionContent) {
    this.questionContent = questionContent;
  }

  public String getQuestionTitle() {
    return questionTitle;
  }

  public void setQuestionTitle(String questionTitle) {
    this.questionTitle = questionTitle;
  }

  public LocalDate getQuestionDate() {
    return questionDate;
  }

  public void setQuestionDate(LocalDate questionDate) {
    this.questionDate = questionDate;
  }

  public Account getFkAccount() {
    return fkAccount;
  }

  public void setFkAccount(Account fkAccount) {
    this.fkAccount = fkAccount;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

}
