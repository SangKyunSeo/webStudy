package com.spring.dao;

import java.util.List;

import com.spring.dto.ItemVO;
import com.spring.dto.ReviewVO;

public interface ReviewDAO {
	public void regReview(ReviewVO reviewVo) throws Exception;
	public List<ReviewVO> reviewList() throws Exception;
}
