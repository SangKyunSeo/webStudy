package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;
import com.spring.dto.PagingVO;
import com.spring.dto.ReviewVO;

@Service
public class ReviewDAOImpl implements ReviewDAO{
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring.mapper.reviewMapper";
    
    @Override
	public void regReview(ReviewVO reviewVo) throws Exception{
    	sqlSession.insert(Namespace+".regReview",reviewVo);
    }
    
    @Override
    public List<ReviewVO> reviewList(int idItem) throws Exception{
    	return sqlSession.selectList(Namespace+".reviewList",idItem);
    }
    
    @Override
    public int countReview(int idItem) throws Exception{
    	return sqlSession.selectOne(Namespace+".countReview",idItem);
    }
    
    @Override
    public List<ReviewVO> selectReview(PagingVO vo,int idItem) throws Exception{
    	Map<String,Object> param = new HashMap<>();
    	param.put("vo", vo);
    	param.put("idItem", idItem);
    	return sqlSession.selectList(Namespace+".selectReview",param);
    }
}
