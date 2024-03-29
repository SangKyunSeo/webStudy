package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.InquiryDAO;
import com.spring.dao.MemberDAO;
import com.spring.dao.OrderDAO;
import com.spring.dao.ReviewDAO;
import com.spring.dto.InquiryVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;
import com.spring.dto.PagingVO;
import com.spring.dto.ReviewVO;
@Service
public class InquiryServiceImpl implements InquiryService {
	@Inject
    private InquiryDAO dao;
    
    @Override
    public void regQna(InquiryVO inquiryVo) throws Exception{
    	dao.regQna(inquiryVo);
    }
    
    @Override
    public List<InquiryVO> inquiryList(int idItem) throws Exception{
    	return dao.inquiryList(idItem);
    }
    
    @Override
    public List<InquiryVO> selectInquiry(PagingVO qnaPaginVo,int idItem) throws Exception{
    	return dao.selectInquiry(qnaPaginVo, idItem);
    }

  
}
