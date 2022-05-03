package com.eeit40.design.Entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.*;

@Entity
@Table(name = "cases")
public class Case {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @ManyToOne
//  @JsonBackReference
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @Column(name= "title", length = 10)
  private String title;

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

  @DateTimeFormat(pattern = "yyyy/MM/dd")
  @JsonFormat(pattern = "yyyy/MM/dd",timezone = "Asia/Taipei")
//  @Temporal(TemporalType.DATE)
  @Column(name = "date_time")
  private Date dateTime;

//  @PrePersist
//  public void onCreate(){
//    if(dateTime == null){
//
//      dateTime = new Date();
////      System.out.println(dateTime);
//    }
//  }

  @Column(name = "expiry_date")
  private Date expiryDate;

  @Column(name = "viewing_count")
  private Integer viewingCount;

  @OneToMany(mappedBy = "fkCases")
  private Set<CasesPhoto> casesPhotos = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkCase")
  private Set<ImgurImg> imgurImgs = new LinkedHashSet<>();

  @Column(name = "cover_photo")
  private String coverPhoto;

  public Case() {
  }

  public Case(Integer id, Member fkMember, String title, String name, String classification, String location, String caseEmail, String message, Date dateTime, Date expiryDate, Integer viewingCount, Set<CasesPhoto> casesPhotos, Set<ImgurImg> imgurImgs, String coverPhoto) {
    this.id = id;
    this.fkMember = fkMember;
    this.title = title;
    this.name = name;
    this.classification = classification;
    this.location = location;
    this.caseEmail = caseEmail;
    this.message = message;
    this.dateTime = dateTime;
    this.expiryDate = expiryDate;
    this.viewingCount = viewingCount;
    this.casesPhotos = casesPhotos;
    this.imgurImgs = imgurImgs;
    this.coverPhoto = coverPhoto;
  }

  @Override
  public String toString() {
    return "Case{" +
            "id=" + id +
            ", fkMember=" + fkMember +
            ", title='" + title + '\'' +
            ", name='" + name + '\'' +
            ", classification='" + classification + '\'' +
            ", location='" + location + '\'' +
            ", caseEmail='" + caseEmail + '\'' +
            ", message='" + message + '\'' +
            ", dateTime=" + dateTime +
            ", expiryDate=" + expiryDate +
            ", viewingCount=" + viewingCount +
            ", casesPhotos=" + casesPhotos +
            ", imgurImgs=" + imgurImgs +
            ", coverPhoto='" + coverPhoto + '\'' +
            '}';
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Member getFkMember() {
    return fkMember;
  }

  public void setFkMember(Member fkMember) {
    this.fkMember = fkMember;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getClassification() {
    return classification;
  }

  public void setClassification(String classification) {
    this.classification = classification;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public String getCaseEmail() {
    return caseEmail;
  }

  public void setCaseEmail(String caseEmail) {
    this.caseEmail = caseEmail;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Date getDateTime() {
    return dateTime;
  }

  public void setDateTime(Date dateTime) {
    this.dateTime = dateTime;
  }

  public Date getExpiryDate() {
    return expiryDate;
  }

  public void setExpiryDate(Date expiryDate) {
    this.expiryDate = expiryDate;
  }

  public Integer getViewingCount() {
    return viewingCount;
  }

  public void setViewingCount(Integer viewingCount) {
    this.viewingCount = viewingCount;
  }

  public Set<CasesPhoto> getCasesPhotos() {
    return casesPhotos;
  }

  public void setCasesPhotos(Set<CasesPhoto> casesPhotos) {
    this.casesPhotos = casesPhotos;
  }

  public Set<ImgurImg> getImgurImgs() {
    return imgurImgs;
  }

  public void setImgurImgs(Set<ImgurImg> imgurImgs) {
    this.imgurImgs = imgurImgs;
  }

  public String getCoverPhoto() {
    return coverPhoto;
  }

  public void setCoverPhoto(String coverPhoto) {
    this.coverPhoto = coverPhoto;
  }
}
