package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.dao.OrderDAO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderVO;
@Service
public class OrderServiceImpl implements OrderService {
	@Inject
    private OrderDAO dao;
    
    @Override
    public void register(OrderVO orderVo) throws Exception{
    	dao.register(orderVo);
    }
    
    @Override
    public List<OrderVO> getMaxOrderId(OrderVO orderVo) throws Exception{
    	return dao.getMaxOrderId(orderVo);
    }
}
