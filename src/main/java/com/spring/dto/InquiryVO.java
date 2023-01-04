package com.spring.dto;

import javax.validation.constraints.NotNull;

public class InquiryVO {
	private int idItemInquiry;
	private String memberId;
	private int idItem;
	private boolean answerItemInquiry;
	private String categoryItemInquiry;
	private String contentItemInquiry;
	private String titleItemInquiry;
	private String dateItemInquiry;
	private boolean secretItemInquiry;
	public int getIdItemInquiry() {
		return idItemInquiry;
	}
	public void setIdItemInquiry(int idItemInquiry) {
		this.idItemInquiry = idItemInquiry;
	}
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
	public boolean isAnswerItemInquiry() {
		return answerItemInquiry;
	}
	public void setAnswerItemInquiry(boolean answerItemInquiry) {
		this.answerItemInquiry = answerItemInquiry;
	}
	public String getCategoryItemInquiry() {
		return categoryItemInquiry;
	}
	public void setCategoryItemInquiry(String categoryItemInquiry) {
		this.categoryItemInquiry = categoryItemInquiry;
	}
	public String getContentItemInquiry() {
		return contentItemInquiry;
	}
	public void setContentItemInquiry(String contentItemInquiry) {
		this.contentItemInquiry = contentItemInquiry;
	}
	public String getTitleItemInquiry() {
		return titleItemInquiry;
	}
	public void setTitleItemInquiry(String titleItemInquiry) {
		this.titleItemInquiry = titleItemInquiry;
	}
	public String getDateItemInquiry() {
		return dateItemInquiry;
	}
	public void setDateItemInquiry(String dateItemInquiry) {
		this.dateItemInquiry = dateItemInquiry;
	}
	public boolean isSecretItemInquiry() {
		return secretItemInquiry;
	}
	public void setSecretItemInquiry(boolean secretItemInquiry) {
		this.secretItemInquiry = secretItemInquiry;
	}
	
	
	
}
