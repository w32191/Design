package com.eeit40.design.Entity;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "activities")
public class Activity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @Column(name = "subject")
  private String subject;

  @Lob
  @Column(name = "content")
  private String content;

  @Column(name = "discount_percentage")
  private Integer discountPercentage;

   // 設定序列化後的格式
  @Column(name = "start_date")
  private LocalDate startDate;

  @Column(name = "end_date")
  private LocalDate endDate;

  @Column(name = "photo")
  private byte[] photo;

  @ManyToMany(cascade = {javax.persistence.CascadeType.ALL})
  @JoinTable(name = "activities_product",
      joinColumns = @JoinColumn(name = "fk_activities_id", referencedColumnName = "id"),
      inverseJoinColumns = @JoinColumn(name = "fk_product_id", referencedColumnName = "id"))
  private Set<Product> products = new LinkedHashSet<>();

  @OneToMany(fetch = javax.persistence.FetchType.EAGER, mappedBy = "fkActivity")
  private Set<ImgurImg> imgurImgs = new LinkedHashSet<>();

  public Activity() {
  }

  public Set<ImgurImg> getImgurImgs() {
    return imgurImgs;
  }

  public void setImgurImgs(Set<ImgurImg> imgurImgs) {
    this.imgurImgs = imgurImgs;
  }

  public byte[] getPhoto() {
    return photo;
  }

  public void setPhoto(byte[] photo) {
    this.photo = photo;
  }

  public LocalDate getEndDate() {
    return endDate;
  }

  public void setEndDate(LocalDate endDate) {
    this.endDate = endDate;
  }

  public LocalDate getStartDate() {
    return startDate;
  }

  public void setStartDate(LocalDate startDate) {
    this.startDate = startDate;
  }

  public Integer getDiscountPercentage() {
    return discountPercentage;
  }

  public void setDiscountPercentage(Integer discountPercentage) {
    this.discountPercentage = discountPercentage;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Set<Product> getProducts() {
    return products;
  }

  public void setProducts(Set<Product> products) {
    this.products = products;
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("Activity{");
    sb.append("id=").append(id);
    sb.append(", subject='").append(subject).append('\'');
    sb.append(", content='").append(content).append('\'');
    sb.append(", discountPercentage=").append(discountPercentage);
    sb.append(", startDate=").append(startDate);
    sb.append(", endDate=").append(endDate);
    sb.append(", photo=").append(Arrays.toString(photo));
    sb.append(", products=[");
    for (Product product : products) {
      sb.append("{id:").append(product.getId()).append("},");
    }
    sb.append("], imgurImgs=").append(imgurImgs);
    sb.append('}');
    return sb.toString();
  }
}
