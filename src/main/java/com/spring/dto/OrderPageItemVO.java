package com.spring.dto;

public class OrderPageItemVO {
	private int idItem;
	private int itemCount;
	
	private String nameItem;
	private int priceItem;
	
	private int salePrice;
	private int totalPrice;
	
	
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public String getNameItem() {
		return nameItem;
	}
	public void setNameItem(String nameItem) {
		this.nameItem = nameItem;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getPriceItem() {
		return priceItem;
	}
	public void setPriceItem(int priceItem) {
		this.priceItem = priceItem;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public void initSaleTotal() {
		this.salePrice = (int)this.priceItem;
		this.totalPrice = this.salePrice * this.itemCount;
	}
	
}
