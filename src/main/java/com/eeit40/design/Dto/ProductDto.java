package com.eeit40.design.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDto implements Serializable {

    private Integer id;

    private Integer fkBrand;

    private Integer productId;

    private String name;

    private String description;

    private Integer price;

    private String categories;

    private Integer stock;

    private String model;

    private String image01;

    private String image02;

    private String image03;

    private String image04;


}