package com.eeit40.design.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class CaseMessageDto implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonProperty("caseMessage")
    private String msg;

    public CaseMessageDto() {
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
