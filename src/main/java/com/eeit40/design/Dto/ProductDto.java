package com.eeit40.design.Dto;

import com.eeit40.design.Entity.Brand;

import java.io.Serializable;
import java.time.LocalDate;

public class ProductDto implements Serializable {

    private Integer id;

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

    public ProductDto(){

    }

    public ProductDto(Integer id, Integer productId, String name, String description, Integer price, String categories, Integer stock, String model, String barcode, Integer views, Integer avaliable, LocalDate added) {
        this.id = id;
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categories = categories;
        this.stock = stock;
        this.model = model;
        this.barcode = barcode;
        this.views = views;
        this.avaliable = avaliable;
        this.added = added;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Integer getAvaliable() {
        return avaliable;
    }

    public void setAvaliable(Integer avaliable) {
        this.avaliable = avaliable;
    }

    public LocalDate getAdded() {
        return added;
    }

    public void setAdded(LocalDate added) {
        this.added = added;
    }



}
