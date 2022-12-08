package com.spring.dto;

public class CartVO {
    private String memberCart;
    private int itemCart;
    private String nameCart;
    private int amountCart;
    private int priceCart;
    private String dateCart;
    
	public String getMemberCart() {
		return memberCart;
	}

	public void setMemberCart(String memberCart) {
		this.memberCart = memberCart;
	}

	public int getItemCart() {
		return itemCart;
	}

	public void setItemCart(int itemCart) {
		this.itemCart = itemCart;
	}

	public int getAmountCart() {
		return amountCart;
	}

	public void setAmountCart(int amountCart) {
		this.amountCart = amountCart;
	}

	public int getPriceCart() {
		return priceCart;
	}

	public void setPriceCart(int priceCart) {
		this.priceCart = priceCart;
	}

	public String getDateCart() {
		return dateCart;
	}

	public void setDateCart(String dateCart) {
		this.dateCart = dateCart;
	}

	public String getNameCart() {
		return nameCart;
	}

	public void setNameCart(String nameCart) {
		this.nameCart = nameCart;
	}
}
