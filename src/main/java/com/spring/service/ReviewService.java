package com.spring.service;

import java.util.List;

import com.spring.dto.OrderVO;
import com.spring.dto.ReviewVO;

public interface ReviewService {
	public void regReview(ReviewVO reviewVo) throws Exception;
	public List<ReviewVO> reviewList() throws Exception;

}
