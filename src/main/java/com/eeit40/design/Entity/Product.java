package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;


    @ManyToOne
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

    @Column(name = "image01", columnDefinition = "VARBINARY(MAX)")
    private byte[] image01;

    @Column(name = "image02", columnDefinition = "VARBINARY(MAX)")
    private byte[] image02;

    @Column(name = "image03", columnDefinition = "VARBINARY(MAX)")
    private byte[] image03;

    @Column(name = "image04", columnDefinition = "VARBINARY(MAX)")
    private byte[] image04;

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


  @OneToMany(mappedBy = "fkProduct")
  private Set<ImgurImg> imgurImgs = new LinkedHashSet<>();

  public Set<ImgurImg> getImgurImgs() {
    return imgurImgs;
  }

  public void setImgurImgs(Set<ImgurImg> imgurImgs) {
    this.imgurImgs = imgurImgs;
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

    public byte[] getImage01() {
        return image01;
    }

    public void setImage01(byte[] image01) {
        this.image01 = image01;
    }

    public byte[] getImage02() {
        return image02;
    }

    public void setImage02(byte[] image02) {
        this.image02 = image02;
    }

    public byte[] getImage03() {
        return image03;
    }

    public void setImage03(byte[] image03) {
        this.image03 = image03;
    }

    public byte[] getImage04() {
        return image04;
    }


    public void setImage04(byte[] image04) {
        this.image04 = image04;
    }
}

