package com.eeit40.design.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shopping_card")
public class ShoppingCard {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_account_id")
  private Account fkAccount;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_product_id")
  private Product fkProduct;

  @Column(name = "temp_mount")
  private Integer tempMount;

  public ShoppingCard() {
  }

  public Integer getTempMount() {
    return tempMount;
  }

  public void setTempMount(Integer tempMount) {
    this.tempMount = tempMount;
  }

  public Product getFkProduct() {
    return fkProduct;
  }

  public void setFkProduct(Product fkProduct) {
    this.fkProduct = fkProduct;
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
