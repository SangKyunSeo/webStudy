package com.spring.dto;

import java.text.DecimalFormat;

import javax.validation.constraints.NotNull;

public class ItemDetailVO {
	private int idItemDetail;
	private int idItem;
	private String firstDetail;
	private String secondDetail;
	private String thirdDetail;
	
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public int getIdItemDetail() {
		return idItemDetail;
	}
	public void setIdItemDetail(int idItemDetail) {
		this.idItemDetail = idItemDetail;
	}
	public String getFirstDetail() {
		return firstDetail;
	}
	public void setFirstDetail(String firstDetail) {
		this.firstDetail = firstDetail;
	}
	public String getSecondDetail() {
		return secondDetail;
	}
	public void setSecondDetail(String secondDetail) {
		this.secondDetail = secondDetail;
	}
	public String getThirdDetail() {
		return thirdDetail;
	}
	public void setThirdDetail(String thirdDetail) {
		this.thirdDetail = thirdDetail;
	}
}
