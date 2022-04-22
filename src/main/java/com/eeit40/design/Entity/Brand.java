package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "brand")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "brand_id")
    private Integer brandId;

    @Column(name = "name", length = 50)
    private String name;

    @Column(name = "img", columnDefinition = "varchar(255)")
    private String img;

    @Column(name = "description")
    private String description;





//    @OneToMany(mappedBy = "fkBrand")
//    private Set<Product> products = new LinkedHashSet<>();

    @OneToOne(mappedBy = "fkBrand")
    private ImgurImg imgurImgs;

    public Brand() {
    }

//    public Set<Product> getProducts() {
//        return products;
//    }

//    public void setProducts(Set<Product> products) {
//        this.products = products;
//    }

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

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public ImgurImg getImgurImgs() {
        return imgurImgs;
    }

    public void setImgurImgs(ImgurImg imgurImgs) {
        this.imgurImgs = imgurImgs;
    }


    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
