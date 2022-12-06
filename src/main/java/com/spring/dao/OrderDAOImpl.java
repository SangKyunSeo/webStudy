package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;

@Service
public class OrderDAOImpl implements OrderDAO{
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring.mapper.orderMapper";
    
    @Override
    public void register(OrderVO orderVo) throws Exception{
    	sqlSession.insert(Namespace+".register",orderVo);
    }
    
    @Override
    public List<OrderVO> getMaxOrderId(OrderVO orderVo) throws Exception{
    	return sqlSession.selectList(Namespace+".search",orderVo);
    }
    
 
}
