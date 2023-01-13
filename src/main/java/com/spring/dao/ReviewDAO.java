package com.spring.dao;

import java.util.List;

import com.spring.dto.ItemVO;
import com.spring.dto.PagingVO;
import com.spring.dto.ReviewVO;

public interface ReviewDAO {
	public void regReview(ReviewVO reviewVo) throws Exception;
	public List<ReviewVO> reviewList(int idItem) throws Exception;
	public int countReview(int idItem) throws Exception;
	public List<ReviewVO> selectReview(PagingVO vo,int idItem) throws Exception;
}
