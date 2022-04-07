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
@Table(name = "order_list")
public class OrderList {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @Column(name = "order_mount")
  private Integer orderMount;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_order_imformation_id")
  private OrderInformation fkOrderImformation;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_product_id")
  private Product fkProduct;

  public OrderList() {
  }

  public Product getFkProduct() {
    return fkProduct;
  }

  public void setFkProduct(Product fkProduct) {
    this.fkProduct = fkProduct;
  }

  public OrderInformation getFkOrderImformation() {
    return fkOrderImformation;
  }

  public void setFkOrderImformation(OrderInformation fkOrderImformation) {
    this.fkOrderImformation = fkOrderImformation;
  }

  public Integer getOrderMount() {
    return orderMount;
  }

  public void setOrderMount(Integer orderMount) {
    this.orderMount = orderMount;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }
}
