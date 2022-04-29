package com.eeit40.design.Entity;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

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
  
  @Column(name = "discount")
  private Integer discount;

  @DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="order_date",columnDefinition = "datetime")
  private Date orderDate;
  
  @PrePersist  
  public void onCreate() {  
	if(orderDate==null) {
	  orderDate = new Date();
	}
   }

  @Column(name = "shipping_date")
  private Date shippingDate;

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

  public Date getShippingDate() {
    return shippingDate;
  }

  public void setShippingDate(Date shippingDate) {
    this.shippingDate = shippingDate;
  }

  public Date getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(Date orderDate) {
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

public Integer getDiscount() {
	return discount;
}

public void setDiscount(Integer discount) {
	this.discount = discount;
}

}
