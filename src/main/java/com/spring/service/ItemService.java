package com.spring.service;

import java.util.List;

import com.spring.dto.ItemVO;

public interface ItemService {
	public void register(ItemVO itemVo)throws Exception;
	public List<ItemVO> list() throws Exception;
	public ItemVO detailList(int idItem) throws Exception;
}
