package com.spring.service;

import java.util.List;

import com.spring.dto.InquiryVO;
import com.spring.dto.OrderVO;
import com.spring.dto.PagingVO;
import com.spring.dto.ReviewVO;

public interface InquiryService {
	public void regQna(InquiryVO inquiryVo) throws Exception;
	public List<InquiryVO> inquiryList(int idItem) throws Exception;
	public List<InquiryVO> selectInquiry(PagingVO qnaPagingVo,int idItem) throws Exception;
}
