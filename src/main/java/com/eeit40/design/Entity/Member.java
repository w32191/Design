package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "member")
public class Member {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @JsonIgnore
  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_account_id")
  private Account fkAccount;

  @Column(name = "\"names\"", length = 30)
  private String names;

  @Column(name = "phone", length = 30)
  private String phone;

  @Column(name = "address")
  private String address;

  @Column(name = "service_area")
  private Integer serviceArea;

  @Column(name = "images")
  private byte[] images;

  @JsonIgnore
  @OneToMany(mappedBy = "fkMember")
  private Set<Punch> punches = new LinkedHashSet<>();

  @JsonIgnore
  @OneToMany(mappedBy = "fkMember")
  private Set<ChatRoom> chatRooms = new LinkedHashSet<>();

  @JsonIgnore
  @OneToMany(mappedBy = "fkMember")
  private Set<Case> cases = new LinkedHashSet<>();

  @JsonIgnore
  @OneToMany(mappedBy = "fkMember")
  private Set<ProductReview> productReviews = new LinkedHashSet<>();

  @JsonIgnore
  @OneToMany(fetch = FetchType.LAZY, mappedBy = "fkMember")
  private List<Design> designServices;

  @JsonIgnore
  @OneToMany(mappedBy = "fkMember")
  private Set<DesignReview> designReviews = new LinkedHashSet<>();

  @OneToOne(mappedBy = "fkMember")
  private ImgurImg imgurImgs;

  public ImgurImg getImgurImgs() {
    return imgurImgs;
  }

  public void setImgurImgs(ImgurImg imgurImgs) {
    this.imgurImgs = imgurImgs;
  }

  public Member() {
  }

  public Set<DesignReview> getDesignReviews() {
    return designReviews;
  }

  public void setDesignReviews(Set<DesignReview> designReviews) {
    this.designReviews = designReviews;
  }

  public List<Design> getDesignServices() {
    return designServices;
  }

  public void setDesignServices(List<Design> designServices) {
    this.designServices = designServices;
  }

  public Set<ProductReview> getProductReviews() {
    return productReviews;
  }

  public void setProductReviews(Set<ProductReview> productReviews) {
    this.productReviews = productReviews;
  }

  public Set<Case> getCases() {
    return cases;
  }

  public void setCases(Set<Case> cases) {
    this.cases = cases;
  }

  public Set<ChatRoom> getChatRooms() {
    return chatRooms;
  }

  public void setChatRooms(Set<ChatRoom> chatRooms) {
    this.chatRooms = chatRooms;
  }

  public Set<Punch> getPunches() {
    return punches;
  }

  public void setPunches(Set<Punch> punches) {
    this.punches = punches;
  }

  public byte[] getImages() {
    return images;
  }

  public void setImages(byte[] images) {
    this.images = images;
  }

  public Integer getServiceArea() {
    return serviceArea;
  }

  public void setServiceArea(Integer serviceArea) {
    this.serviceArea = serviceArea;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getNames() {
    return names;
  }

  public void setNames(String names) {
    this.names = names;
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
