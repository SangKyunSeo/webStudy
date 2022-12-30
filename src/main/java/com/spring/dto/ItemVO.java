package com.spring.dto;

import javax.validation.constraints.NotNull;

public class ItemVO {
	private int idItem;
	
	@NotNull
	private String nameItem;
	private String madeItem;
	private String imageItem;
	private int priceItem;
	private int stockItem;
	
	
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
	public String getMadeItem() {
		return madeItem;
	}
	public void setMadeItem(String madeItem) {
		this.madeItem = madeItem;
	}
	public String getImageItem() {
		return imageItem;
	}
	public void setImageItem(String imageItem) {
		this.imageItem = imageItem;
	}
	public int getPriceItem() {
		return priceItem;
	}
	public void setPriceItem(int priceItem) {
		this.priceItem = priceItem;
	}
	public int getStockItem() {
		return stockItem;
	}
	public void setStockItem(int stockItem) {
		this.stockItem = stockItem;
	}
}
