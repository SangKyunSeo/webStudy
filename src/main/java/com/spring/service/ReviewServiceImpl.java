package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.dao.OrderDAO;
import com.spring.dao.ReviewDAO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;
import com.spring.dto.ReviewVO;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
    private ReviewDAO dao;
    
    @Override
    public void regReview(ReviewVO reviewVo) throws Exception{
    	dao.regReview(reviewVo);
    }
    
    @Override
    public List<ReviewVO> reviewList(int idItem) throws Exception{
    	return dao.reviewList(idItem);
    }
  
}
