package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.CartDAO;
import com.spring.dao.MemberDAO;
import com.spring.dao.OrderDAO;
import com.spring.dto.CartVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;
@Service
public class CartServiceImpl implements CartService {
	@Inject
    private CartDAO dao;
    
    @Override
    public void register(CartVO cartVo) throws Exception{
    	dao.register(cartVo);
    }
    
    @Override
    public List<CartVO> search(String memberId) throws Exception{
    	return dao.search(memberId);
    }
 
    @Override
    public void delete(String memberCart, int itemCart) throws Exception{
    	dao.delete(memberCart,itemCart);
    }
    
    @Override
    public int calCount(String memberId) throws Exception{
    	return dao.calCount(memberId);
    }
}
