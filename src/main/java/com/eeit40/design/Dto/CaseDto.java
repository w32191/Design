package com.eeit40.design.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.Date;

public class CaseDto implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonProperty("titleDto")
    private String titleDto;

    @JsonProperty("nameDto")
    private String nameDto;

    @JsonProperty("classificationDto")
    private String classificationDto;

    @JsonProperty("locationDto")
    private String locationDto;

    @JsonProperty("caseEmailDto")
    private String caseEmailDto;

    @JsonProperty("messageDto")
    private String messageDto;

    @JsonProperty("expiryDateDto")
    private Date expiryDateDto;

    public CaseDto() {
    }

    public CaseDto(String titleDto, String nameDto, String classificationDto, String locationDto, String caseEmailDto, String messageDto, Date expiryDateDto) {
        this.titleDto = titleDto;
        this.nameDto = nameDto;
        this.classificationDto = classificationDto;
        this.locationDto = locationDto;
        this.caseEmailDto = caseEmailDto;
        this.messageDto = messageDto;
        this.expiryDateDto = expiryDateDto;
    }

    public String getTitleDto() {
        return titleDto;
    }

    public void setTitleDto(String titleDto) {
        this.titleDto = titleDto;
    }

    public String getNameDto() {
        return nameDto;
    }

    public void setNameDto(String nameDto) {
        this.nameDto = nameDto;
    }

    public String getClassificationDto() {
        return classificationDto;
    }

    public void setClassificationDto(String classificationDto) {
        this.classificationDto = classificationDto;
    }

    public String getLocationDto() {
        return locationDto;
    }

    public void setLocationDto(String locationDto) {
        this.locationDto = locationDto;
    }

    public String getCaseEmailDto() {
        return caseEmailDto;
    }

    public void setCaseEmailDto(String caseEmailDto) {
        this.caseEmailDto = caseEmailDto;
    }

    public String getMessageDto() {
        return messageDto;
    }

    public void setMessageDto(String messageDto) {
        this.messageDto = messageDto;
    }

    public Date getExpiryDateDto() {
        return expiryDateDto;
    }

    public void setExpiryDateDto(Date expiryDateDto) {
        this.expiryDateDto = expiryDateDto;
    }

    @Override
    public String toString() {
        return "CaseDto{" +
                "titleDto='" + titleDto + '\'' +
                ", nameDto='" + nameDto + '\'' +
                ", classificationDto='" + classificationDto + '\'' +
                ", locationDto='" + locationDto + '\'' +
                ", caseEmailDto='" + caseEmailDto + '\'' +
                ", messageDto='" + messageDto + '\'' +
                ", expiryDateDto=" + expiryDateDto +
                '}';
    }
}
