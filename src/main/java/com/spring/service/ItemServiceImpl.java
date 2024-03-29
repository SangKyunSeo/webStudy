package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ItemDAO;
import com.spring.dto.ItemDetailVO;
import com.spring.dto.ItemVO;

@Service
public class ItemServiceImpl implements ItemService{
	@Inject
	private ItemDAO itemdao;
	
	@Override
	public void register(ItemVO itemVo) throws Exception{
		itemdao.register(itemVo);
	}
	
	@Override
	public void registerDetail(ItemDetailVO itemDetailVo) throws Exception{
		itemdao.registerDetail(itemDetailVo);
	}
	@Override
	public List<ItemVO> list() throws Exception{
		return itemdao.list();
	}
	
	@Override
	public List<ItemVO> searchItems(String nameItem) throws Exception{
		return itemdao.searchItems(nameItem);
	}
	
	@Override
	public ItemVO detailList(int idItem) throws Exception{
		return itemdao.detailList(idItem);
	}
	
	@Override
	public ItemDetailVO getItemDetail(int idItem) throws Exception{
		return itemdao.getItemDetail(idItem);
	}
	
	@Override
	public void delete(int idItem) throws Exception{
		itemdao.delete(idItem);
	}
	
	@Override
	public ItemVO cartItem(int idItem) throws Exception{
		return itemdao.cartItem(idItem);
	}
	
	@Override
	public void update(ItemVO itemVo) throws Exception{
		itemdao.update(itemVo);
	}
	
	@Override
	public List<ItemVO> categoryList(String category) throws Exception{
		return itemdao.categoryList(category);
	}
}
