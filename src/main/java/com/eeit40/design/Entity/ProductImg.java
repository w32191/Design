package com.eeit40.design.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product_img")
public class ProductImg {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_product_id")
  private Product fkProduct;

  @Column(name = "\"order\"")
  private Integer order;

  @Column(name = "img")
  private byte[] img;

  @Column(name = "description")
  private String description;

  public ProductImg() {
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public byte[] getImg() {
    return img;
  }

  public void setImg(byte[] img) {
    this.img = img;
  }

  public Integer getOrder() {
    return order;
  }

  public void setOrder(Integer order) {
    this.order = order;
  }

  public Product getFkProduct() {
    return fkProduct;
  }

  public void setFkProduct(Product fkProduct) {
    this.fkProduct = fkProduct;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

}
