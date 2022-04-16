package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "imgurImg")
public class ImgurImg {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @Column(name = "link", nullable = false)
  private String link;

  @Column(name = "delete_hash", nullable = false)
  private String deleteHash;

  @Column(name = "img_name")
  private String imgName;

  @Column(name = "type", length = 50)
  private String type;

  @JsonIgnore
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_activity_id")
  private Activity fkActivity;

  public Activity getFkActivity() {
    return fkActivity;
  }

  public void setFkActivity(Activity fkActivity) {
    this.fkActivity = fkActivity;
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

}
