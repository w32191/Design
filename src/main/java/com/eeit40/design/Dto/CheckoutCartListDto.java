package com.eeit40.design.Dto;

import java.io.Serializable;

import com.eeit40.design.Entity.Account;
import com.eeit40.design.Entity.Product;

public class CheckoutCartListDto implements Serializable {

	private static final long serialVersionUID = 1L;

	//shopping cart
	
	  private Integer id;

	  private Account fkAccount;

	  private Product fkProduct;

	  private Integer tempMount;
	  
	  //product
	  
	  private Integer productId;
	  
	  private String name;
	  
	  private String model;
	  
	  private Integer price;
	  
	  //新增小計
	  private Integer tprice;
	  
	  public CheckoutCartListDto() {
		  
	  }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Account getFkAccount() {
		return fkAccount;
	}

	public void setFkAccount(Account fkAccount) {
		this.fkAccount = fkAccount;
	}

	public Product getFkProduct() {
		return fkProduct;
	}

	public void setFkProduct(Product fkProduct) {
		this.fkProduct = fkProduct;
	}

	public Integer getTempMount() {
		return tempMount;
	}

	public void setTempMount(Integer tempMount) {
		this.tempMount = tempMount;
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

	public Integer getTprice() {
		return tprice;
	}

	public void setTprice(Integer tprice) {
		this.tprice = tprice;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	  
}
