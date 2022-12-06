package com.spring.service;

import java.util.List;

import com.spring.dto.CartVO;
import com.spring.dto.OrderVO;

public interface CartService {
	public void register(CartVO cartVo) throws Exception;

}
