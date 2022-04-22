package com.eeit40.design.Dto;

import com.eeit40.design.Entity.Brand;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

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

    private Brand fkBrand;

    public ProductDto() {
    }

    public ProductDto(Integer id, Integer productId, String name, String description, Integer price, String categories, Integer stock, String model, String barcode, Integer views, Integer avaliable, LocalDate added, Brand fkBrand) {
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
        this.fkBrand = fkBrand;
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "id=" + id +
                ", productId=" + productId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", categories='" + categories + '\'' +
                ", stock=" + stock +
                ", model='" + model + '\'' +
                ", barcode='" + barcode + '\'' +
                ", views=" + views +
                ", avaliable=" + avaliable +
                ", added=" + added +
                ", fkBrand=" + fkBrand +
                '}';
    }
}