package com.spring.dto;

public class CartVO {
    private String memberId;
    private int idItem;
    private String nameCart;
    private int amountCart;
    private int priceCart;
    private String dateCart;
    
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getIdItem() {
		return idItem;
	}

	public void setIdItem(int idItem) {
		this.idItem = idItem;
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
