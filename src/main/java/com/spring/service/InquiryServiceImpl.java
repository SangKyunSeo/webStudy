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
import com.spring.dto.ReviewVO;
@Service
public class InquiryServiceImpl implements InquiryService {
	@Inject
    private InquiryDAO dao;
    
    @Override
    public void regQna(InquiryVO inquiryVo) throws Exception{
    	dao.regQna(inquiryVo);
    }

  
}
