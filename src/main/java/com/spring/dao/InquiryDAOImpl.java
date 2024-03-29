package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dto.InquiryVO;
import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;
import com.spring.dto.PagingVO;
import com.spring.dto.ReviewVO;

@Service
public class InquiryDAOImpl implements InquiryDAO{
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring.mapper.inquiryMapper";
    
    @Override
	public void regQna(InquiryVO inquiryVo) throws Exception{
    	sqlSession.insert(Namespace+".regQna",inquiryVo);
    }
    
    @Override
    public List<InquiryVO> inquiryList(int idItem) throws Exception{
    	return sqlSession.selectList(Namespace+".inquiryList",idItem);
    }
   
    @Override
    public List<InquiryVO> selectInquiry(PagingVO qnaPagingVo,int idItem) throws Exception{
    	Map<String,Object> map = new HashMap<>();
    	map.put("vo", qnaPagingVo);
    	map.put("idItem", idItem);
    	return sqlSession.selectList(Namespace+".selectInquiry",map);
    }
}
