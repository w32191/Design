package com.eeit40.design.Entity;

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
@Table(name = "cases_photo")
public class CasesPhoto {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "case_photo_id", nullable = false)
  private Integer case_photo_id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_cases_id")
  private Case fkCases;

  @Column(name = "case_photo_url")
  private String case_photo_url;

  @Lob
  @Column(name = "case_photo_message")
  private String case_photo_message;

  public CasesPhoto() {
  }

  public CasesPhoto(Integer case_photo_id, Case fkCases, String case_photo_url, String case_photo_message) {
    this.case_photo_id = case_photo_id;
    this.fkCases = fkCases;
    this.case_photo_url = case_photo_url;
    this.case_photo_message = case_photo_message;
  }

  public Integer getCase_photo_id() {
    return case_photo_id;
  }

  public void setCase_photo_id(Integer case_photo_id) {
    this.case_photo_id = case_photo_id;
  }

  public Case getFkCases() {
    return fkCases;
  }

  public void setFkCases(Case fkCases) {
    this.fkCases = fkCases;
  }

  public String getCase_photo_url() {
    return case_photo_url;
  }

  public void setCase_photo_url(String case_photo_url) {
    this.case_photo_url = case_photo_url;
  }

  public String getCase_photo_message() {
    return case_photo_message;
  }

  public void setCase_photo_message(String case_photo_message) {
    this.case_photo_message = case_photo_message;
  }
}
