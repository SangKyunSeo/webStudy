package com.spring.dao;

import java.util.List;

import com.spring.dto.InquiryVO;
import com.spring.dto.ItemVO;
import com.spring.dto.ReviewVO;

public interface InquiryDAO {
	public void regQna(InquiryVO inquiryVo) throws Exception;
	public List<InquiryVO> inquiryList(int idItem) throws Exception;
}
