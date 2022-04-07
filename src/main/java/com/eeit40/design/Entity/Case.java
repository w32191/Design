package com.eeit40.design.Entity;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "cases")
public class Case {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @Column(name = "name", length = 50)
  private String name;

  @Column(name = "classification", length = 50)
  private String classification;

  @Column(name = "location", length = 10)
  private String location;

  @Column(name = "case_email", length = 100)
  private String caseEmail;

  @Lob
  @Column(name = "message")
  private String message;

  @Column(name = "date_time")
  private LocalDate dateTime;

  @Column(name = "expiry_date")
  private LocalDate expiryDate;

  @Column(name = "viewing_count")
  private Integer viewingCount;

  @OneToMany(mappedBy = "fkCases")
  private Set<CasesPhoto> casesPhotos = new LinkedHashSet<>();

  public Case() {
  }

  public Set<CasesPhoto> getCasesPhotos() {
    return casesPhotos;
  }

  public void setCasesPhotos(Set<CasesPhoto> casesPhotos) {
    this.casesPhotos = casesPhotos;
  }

  public Integer getViewingCount() {
    return viewingCount;
  }

  public void setViewingCount(Integer viewingCount) {
    this.viewingCount = viewingCount;
  }

  public LocalDate getExpiryDate() {
    return expiryDate;
  }

  public void setExpiryDate(LocalDate expiryDate) {
    this.expiryDate = expiryDate;
  }

  public LocalDate getDateTime() {
    return dateTime;
  }

  public void setDateTime(LocalDate dateTime) {
    this.dateTime = dateTime;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getCaseEmail() {
    return caseEmail;
  }

  public void setCaseEmail(String caseEmail) {
    this.caseEmail = caseEmail;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public String getClassification() {
    return classification;
  }

  public void setClassification(String classification) {
    this.classification = classification;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
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
