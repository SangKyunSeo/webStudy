package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ItemDAO;
import com.spring.dto.ItemVO;

@Service
public class ItemServiceImpl implements ItemService{
	@Inject
	private ItemDAO itemdao;
	
	@Override
	public void register(ItemVO itemVo) throws Exception{
		itemdao.register(itemVo);
	}
}
