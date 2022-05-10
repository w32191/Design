package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "design_service")
public class Design {


  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @Column(name = "name", length = 50)
  private String name;

  @Column(name = "style", length = 10)
  private String classification;

  @Column(name = "price")
  private Integer price;

  @Lob
  @Column(name = "message")
  private String message;

  @OneToMany(mappedBy = "fkService")
  private Set<ServicePhoto> servicePhotos = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkDesign")
  private Set<DesignReview> designReviews = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkDesign")
  private Set<ImgurImg> imgurImgs = new LinkedHashSet<>();

  @Column(name = "cover_photo")
  private String coverPhoto;

  private String photo_1;

  private String photo_2;

  @Column(name = "create_time")
  @JsonFormat(pattern = "yyyy/MM/dd",timezone = "Asia/Taipei")
  public Date creatTime;

  public String title;



  public Design() {
  }

  public Design(Integer id, Member fkMember, String name, String classification, Integer price, String message, Set<ServicePhoto> servicePhotos, Set<DesignReview> designReviews, Set<ImgurImg> imgurImgs, String coverPhoto, Date creatTime, String title) {
    this.id = id;
    this.fkMember = fkMember;
    this.name = name;
    this.classification = classification;
    this.price = price;
    this.message = message;
    this.servicePhotos = servicePhotos;
    this.designReviews = designReviews;
    this.imgurImgs = imgurImgs;
    this.coverPhoto = coverPhoto;
    this.creatTime = creatTime;
    this.title = title;
    this.photo_1 = photo_1;
    this.photo_2 = photo_2;
  }

  public String getPhoto_1() {
    return photo_1;
  }

  public void setPhoto_1(String photo_1) {
    this.photo_1 = photo_1;
  }

  public String getPhoto_2() {
    return photo_2;
  }

  public void setPhoto_2(String photo_2) {
    this.photo_2 = photo_2;
  }

  public Date getCreatTime() {
    return creatTime;
  }

  public void setCreatTime(Date creatTime) {
    this.creatTime = creatTime;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getCoverPhoto() {
    return coverPhoto;
  }

  public void setCoverPhoto(String coverPhoto) {
    this.coverPhoto = coverPhoto;
  }

  public Set<ImgurImg> getImgurImgs() {
    return imgurImgs;
  }

  public void setImgurImgs(Set<ImgurImg> imgurImgs) {
    this.imgurImgs = imgurImgs;
  }

  public Set<DesignReview> getDesignReviews() {
    return designReviews;
  }

  public void setDesignReviews(Set<DesignReview> designReviews) {
    this.designReviews = designReviews;
  }

  public Set<ServicePhoto> getServicePhotos() {
    return servicePhotos;
  }

  public void setServicePhotos(Set<ServicePhoto> servicePhotos) {
    this.servicePhotos = servicePhotos;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Integer getPrice() {
    return price;
  }

  public void setPrice(Integer price) {
    this.price = price;
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
