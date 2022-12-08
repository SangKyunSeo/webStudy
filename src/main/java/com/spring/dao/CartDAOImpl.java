package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dto.CartVO;
import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;

@Service
public class CartDAOImpl implements CartDAO{
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring.mapper.cartMapper";
    
    @Override
    public void register(CartVO cartVo) throws Exception{
    	sqlSession.insert(Namespace+".register",cartVo);
    }
    
    @Override
    public List<CartVO> search(String memberId) throws Exception{
    	return sqlSession.selectList(Namespace+".search",memberId);
    }
    
    @Override
    public void delete(String memberCart,int itemCart) throws Exception{
    	Map<String, Object> param = new HashMap<>();
    	param.put("memberCart", memberCart);
    	param.put("itemCart", itemCart);
    	sqlSession.delete(Namespace+".delete",param);
    }
 
}
