package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "imgurImg")
public class ImgurImg {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Integer id;

  @Column(name = "link")
  private String link;

  @Column(name = "delete_hash")
  private String deleteHash;

  @Column(name = "img_name")
  private String imgName;

  @Column(name = "file_type", length = 50)
  private String type;

  @Column(name = "authorization_account", length = 50)
  private String authorizationAccount;

  @Column(name = "\"order\"")
  private Integer order;

  @Lob
  @Column(name = "message")
  private String message;

  @JsonIgnore
  @ManyToOne(fetch = FetchType.LAZY, cascade = javax.persistence.CascadeType.ALL)
  @JoinColumn(name = "fk_activity_id")
  private Activity fkActivity;

  @JsonIgnore
  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_account_id")
  private Account fkAccount;

  @JsonIgnore
  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @JsonIgnore
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_design_service_id")
  private Design fkDesign;

  @JsonIgnore
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_case_id")
  private Case fkCase;


  public Case getFkCase() {
    return fkCase;
  }

  public void setFkCase(Case fkCase) {
    this.fkCase = fkCase;
  }

  public Design getFkDesignService() {
    return fkDesign;
  }

  public void setFkDesignService(Design fkDesign) {
    this.fkDesign = fkDesign;
  }

  public Member getFkMember() {
    return fkMember;
  }

  public void setFkMember(Member fkMember) {
    this.fkMember = fkMember;
  }

  public Account getFkAccount() {
    return fkAccount;
  }

  public void setFkAccount(Account fkAccount) {
    this.fkAccount = fkAccount;
  }


  public ImgurImg() {
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getLink() {
    return link;
  }

  public void setLink(String link) {
    this.link = link;
  }

  public String getDeleteHash() {
    return deleteHash;
  }

  public void setDeleteHash(String deleteHash) {
    this.deleteHash = deleteHash;
  }

  public String getImgName() {
    return imgName;
  }

  public void setImgName(String imgName) {
    this.imgName = imgName;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getAuthorizationAccount() {
    return authorizationAccount;
  }

  public void setAuthorizationAccount(String authorizationAccount) {
    this.authorizationAccount = authorizationAccount;
  }

  public Integer getOrder() {
    return order;
  }

  public void setOrder(Integer order) {
    this.order = order;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Activity getFkActivity() {
    return fkActivity;
  }

  public void setFkActivity(Activity fkActivity) {
    this.fkActivity = fkActivity;
  }
}
