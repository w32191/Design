package com.eeit40.design.Entity;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "order_information")
public class OrderInformation {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_account_id")
  private Account fkAccount;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_coupon_id")
  private DiscountCoupon fkCoupon;

  @Column(name = "total")
  private Integer total;

  @Column(name = "order_date")
  private Instant orderDate;

  @Column(name = "shipping_date")
  private Instant shippingDate;

  @Column(name = "name", length = 30)
  private String name;

  @Column(name = "phone", length = 50)
  private String phone;

  @Column(name = "store_name", length = 50)
  private String storeName;

  @Column(name = "store_add", length = 100)
  private String storeAdd;

  @Column(name = "\"add\"", length = 100)
  private String add;

  @Column(name = "ship_state", length = 20)
  private String shipState;

  @Column(name = "notes")
  private String notes;

  @OneToMany(mappedBy = "fkOrderImformation")
  private Set<OrderList> orderLists = new LinkedHashSet<>();

  public OrderInformation() {
  }

  public Set<OrderList> getOrderLists() {
    return orderLists;
  }

  public void setOrderLists(Set<OrderList> orderLists) {
    this.orderLists = orderLists;
  }

  public String getNotes() {
    return notes;
  }

  public void setNotes(String notes) {
    this.notes = notes;
  }

  public String getShipState() {
    return shipState;
  }

  public void setShipState(String shipState) {
    this.shipState = shipState;
  }

  public String getAdd() {
    return add;
  }

  public void setAdd(String add) {
    this.add = add;
  }

  public String getStoreAdd() {
    return storeAdd;
  }

  public void setStoreAdd(String storeAdd) {
    this.storeAdd = storeAdd;
  }

  public String getStoreName() {
    return storeName;
  }

  public void setStoreName(String storeName) {
    this.storeName = storeName;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Instant getShippingDate() {
    return shippingDate;
  }

  public void setShippingDate(Instant shippingDate) {
    this.shippingDate = shippingDate;
  }

  public Instant getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(Instant orderDate) {
    this.orderDate = orderDate;
  }

  public Integer getTotal() {
    return total;
  }

  public void setTotal(Integer total) {
    this.total = total;
  }

  public DiscountCoupon getFkCoupon() {
    return fkCoupon;
  }

  public void setFkCoupon(DiscountCoupon fkCoupon) {
    this.fkCoupon = fkCoupon;
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
