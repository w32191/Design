package com.eeit40.design.Dto;

import com.eeit40.design.Entity.Activity;
import com.eeit40.design.Entity.Brand;
import com.eeit40.design.Entity.OrderList;
import com.eeit40.design.Entity.Product;
import com.eeit40.design.Entity.ProductImg;
import com.eeit40.design.Entity.ProductReview;
import com.eeit40.design.Entity.ShoppingCard;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductAndDiscount {

  private Integer id;

  private Brand fkBrand;

  private Integer productId;

  private String name;

  private String description;

  private Integer price;

  private String categories;

  private Integer stock;

  private String model;

  private String barcode;

  private Integer views;

  private Integer avaliable;

  private LocalDate added;

  private String image01;

  private String image02;

  private String image03;

  private String image04;


  private Integer discountPercentage;

  public ProductAndDiscount(Product product) {
    this.id = product.getId();
    this.fkBrand = product.getFkBrand();
    this.productId = product.getProductId();
    this.name = product.getName();
    this.description = product.getDescription();
    this.price = product.getPrice();
    this.categories = product.getCategories();
    this.stock = product.getStock();
    this.model = product.getModel();
    this.barcode = product.getBarcode();
    this.views = product.getViews();
    this.avaliable = product.getAvaliable();
    this.added = product.getAdded();
    this.image01 = product.getImage01();
    this.image02 = product.getImage02();
    this.image03 = product.getImage03();
    this.image04 = product.getImage04();
  }
}
