package com.eeit40.design.Dto;

import com.eeit40.design.Entity.CasesPhoto;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

public class CaseDto {


    @NotNull
    @JsonProperty("title")
    private String title;

    @JsonProperty("name")
    private String name;

    @NotNull
    @JsonProperty("classification")
    private String classification;

    @NotNull
    @JsonProperty("location")
    private String location;

    @JsonProperty("caseEmail")
    private String caseEmail;

    @JsonProperty("message")
    private String message;

    @JsonProperty("expiryDate")
    private Date expiryDate;

    @JsonProperty("casesPhoto")
    private List<CasesPhoto> casesPhoto;

    private String coverPhoto;


//    private List<String> list;
//
//    public List<String> getList() {
//        return list;
//    }
//
//    public void setList(List<String> list) {
//        this.list = list;
//    }


    public String getCoverPhoto() {
        return coverPhoto;
    }

    public void setCoverPhoto(String coverPhoto) {
        this.coverPhoto = coverPhoto;
    }

    public List<CasesPhoto> getCasesPhoto() {
        return casesPhoto;
    }

    public void setCasesPhoto(List<CasesPhoto> casesPhoto) {
        this.casesPhoto = casesPhoto;
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

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCaseEmail() {
        return caseEmail;
    }

    public void setCaseEmail(String caseEmail) {
        this.caseEmail = caseEmail;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }
}
