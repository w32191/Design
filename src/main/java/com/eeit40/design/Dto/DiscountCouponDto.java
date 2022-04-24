package com.eeit40.design.Dto;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;

public class DiscountCouponDto implements Serializable {

	private static final long serialVersionUID = 1L;

	  private Integer id;

	  private String coupon;
	  
	  private Integer discount;

	  private LocalDate startDate;

	  private LocalDate endDate;

	  private String errMsg;
	  
	  public DiscountCouponDto() {
	  }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	
	  
}
