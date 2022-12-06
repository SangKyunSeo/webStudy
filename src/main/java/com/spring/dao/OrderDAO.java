package com.spring.dao;

import java.util.List;

import com.spring.dto.OrderVO;

public interface OrderDAO {
	public void register(OrderVO orderVo) throws Exception;
	public List<OrderVO> getMaxOrderId(OrderVO orderVo) throws Exception;
}
