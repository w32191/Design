package com.eeit40.design.Dto;

import java.util.Date;

public class DesignDto {

    private Integer id;

    private String name;

    private String style;

    private Integer price;

    private String message;

    private String coverPhoto;

    private Date createTime;

    private String title;

    private String photo_1;

    private String photo_2;

    private String location;

    private Integer fk_member_id;

    public Integer getFk_member_id() {
        return fk_member_id;
    }

    public void setFk_member_id(Integer fk_member_id) {
        this.fk_member_id = fk_member_id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhoto_1() {
        return photo_1;
    }

    public void setPhoto_1(String photo_1) {
        this.photo_1 = photo_1;
    }

    public String getPhoto_2() {
        return photo_2;
    }

    public void setPhoto_2(String photo_2) {
        this.photo_2 = photo_2;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCoverPhoto() {
        return coverPhoto;
    }

    public void setCoverPhoto(String coverPhoto) {
        this.coverPhoto = coverPhoto;
    }
}
