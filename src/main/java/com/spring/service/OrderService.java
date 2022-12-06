package com.spring.service;

import java.util.List;

import com.spring.dto.OrderVO;

public interface OrderService {
	public void register(OrderVO orderVo) throws Exception;
	public List<OrderVO> getMaxOrderId(OrderVO orderVo) throws Exception;

}
