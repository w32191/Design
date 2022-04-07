package com.eeit40.design.Entity;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "design_service")
public class DesignService {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @Column(name = "name", length = 50)
  private String name;

  @Column(name = "classification", length = 10)
  private String classification;

  @Column(name = "price")
  private Integer price;

  @Lob
  @Column(name = "message")
  private String message;

  @OneToMany(mappedBy = "fkService")
  private Set<ServicePhoto> servicePhotos = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkDesignService")
  private Set<DesignReview> designReviews = new LinkedHashSet<>();

  public DesignService() {
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
