package com.eeit40.design.Entity;

import java.time.LocalDate;
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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_brand_id")
  private Brand fkBrand;

  @Column(name = "product_id")
  private Integer productId;

  @Column(name = "name", length = 50)
  private String name;

  @Column(name = "description")
  private String description;

  @Column(name = "price")
  private Integer price;

  @Column(name = "categories", length = 50)
  private String categories;

  @Column(name = "stock")
  private Integer stock;

  @Column(name = "model")
  private String model;

  @Lob
  @Column(name = "barcode")
  private String barcode;

  @Column(name = "views")
  private Integer views;

  @Column(name = "avaliable")
  private Integer avaliable;

  @Column(name = "added")
  private LocalDate added;

  @ManyToMany(mappedBy = "products")
  private Set<Activity> activities = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkProduct")
  private Set<ProductImg> productImgs = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkProduct")
  private Set<ProductReview> productReviews = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkProduct")
  private Set<OrderList> orderLists = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkProduct")
  private Set<ShoppingCard> shoppingCards = new LinkedHashSet<>();

  public Product() {
  }

  public Set<ShoppingCard> getShoppingCards() {
    return shoppingCards;
  }

  public void setShoppingCards(Set<ShoppingCard> shoppingCards) {
    this.shoppingCards = shoppingCards;
  }

  public Set<OrderList> getOrderLists() {
    return orderLists;
  }

  public void setOrderLists(Set<OrderList> orderLists) {
    this.orderLists = orderLists;
  }

  public Set<ProductReview> getProductReviews() {
    return productReviews;
  }

  public void setProductReviews(Set<ProductReview> productReviews) {
    this.productReviews = productReviews;
  }

  public Set<ProductImg> getProductImgs() {
    return productImgs;
  }

  public void setProductImgs(Set<ProductImg> productImgs) {
    this.productImgs = productImgs;
  }

  public Set<Activity> getActivities() {
    return activities;
  }

  public void setActivities(Set<Activity> activities) {
    this.activities = activities;
  }

  public LocalDate getAdded() {
    return added;
  }

  public void setAdded(LocalDate added) {
    this.added = added;
  }

  public Integer getAvaliable() {
    return avaliable;
  }

  public void setAvaliable(Integer avaliable) {
    this.avaliable = avaliable;
  }

  public Integer getViews() {
    return views;
  }

  public void setViews(Integer views) {
    this.views = views;
  }

  public String getBarcode() {
    return barcode;
  }

  public void setBarcode(String barcode) {
    this.barcode = barcode;
  }

  public String getModel() {
    return model;
  }

  public void setModel(String model) {
    this.model = model;
  }

  public Integer getStock() {
    return stock;
  }

  public void setStock(Integer stock) {
    this.stock = stock;
  }

  public String getCategories() {
    return categories;
  }

  public void setCategories(String categories) {
    this.categories = categories;
  }

  public Integer getPrice() {
    return price;
  }

  public void setPrice(Integer price) {
    this.price = price;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getProductId() {
    return productId;
  }

  public void setProductId(Integer productId) {
    this.productId = productId;
  }

  public Brand getFkBrand() {
    return fkBrand;
  }

  public void setFkBrand(Brand fkBrand) {
    this.fkBrand = fkBrand;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

}
