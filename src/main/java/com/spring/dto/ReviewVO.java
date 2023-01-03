package com.spring.dto;

import javax.validation.constraints.NotNull;

public class ReviewVO {
	private int idReview;
	private int idItem;
	private String memberId;
	private String contentReview;
	private int scoreReview;
	private String dateReview;
	public int getIdReview() {
		return idReview;
	}
	public void setIdReview(int idReview) {
		this.idReview = idReview;
	}
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContentReview() {
		return contentReview;
	}
	public void setContentReview(String contentReview) {
		this.contentReview = contentReview;
	}
	public int getScoreReview() {
		return scoreReview;
	}
	public void setScoreReview(int scoreReview) {
		this.scoreReview = scoreReview;
	}
	public String getDateReview() {
		return dateReview;
	}
	public void setDateReview(String dateReview) {
		this.dateReview = dateReview;
	}
	
}
