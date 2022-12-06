package com.spring.dto;

public class OrderVO {
    private int idOrder;
    private String memberId;
    private String addressOrder;
    private String dateOrder;
    private int idItem;
    private int amountOrder;
    private int priceOrder;
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}

	public String getAddressOrder() {
		return addressOrder;
	}

	public void setAddressOrder(String addressOrder) {
		this.addressOrder = addressOrder;
	}

	public String getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(String dateOrder) {
		this.dateOrder = dateOrder;
	}

	public int getIdItem() {
		return idItem;
	}

	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}

	public int getAmountOrder() {
		return amountOrder;
	}

	public void setAmountOrder(int amountOrder) {
		this.amountOrder = amountOrder;
	}

	public int getPriceOrder() {
		return priceOrder;
	}

	public void setPriceOrder(int priceOrder) {
		this.priceOrder=priceOrder*amountOrder;
	}
}
