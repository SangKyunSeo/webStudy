package com.spring.dao;

import java.util.List;

import com.spring.dto.CartVO;
import com.spring.dto.OrderVO;

public interface CartDAO {
	public void register(CartVO cartVo) throws Exception;
	public List<CartVO> search(String memberId) throws Exception;
}
