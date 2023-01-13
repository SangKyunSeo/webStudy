package com.spring.dto;

import javax.validation.constraints.NotNull;

public class PagingVO {
	final private int cntPerPage = 7;
	final private int cntPage = 5;
	private int nowPage;
	private int startPage;
	private int endPage;
	private int totalCnt;
	private int totalPage;
	private int start;
	private int end;
	
	public PagingVO(int totalCnt, int nowPage) {
		setNowPage(nowPage);
		setTotalCnt(totalCnt);
		calTotalPage(getTotalCnt(),cntPerPage);
		calStartEndPage(getNowPage(),cntPage);
		calStartEnd(getNowPage(),cntPerPage);
	}
	
	public void calTotalPage(int totalCnt,int cntPerPage) {
		setTotalPage((int)Math.ceil(totalCnt/cntPerPage));
	}
	
	public void calStartEndPage(int nowPage,int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage/(double)cntPage))*cntPage);
		if(getEndPage()>getTotalPage()) {
			setEndPage(getTotalPage());
		}
		setStartPage(getEndPage()-cntPage+1);
		if(getStartPage()<1) {
			setStartPage(1);
		}
	}
	
	public void calStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
