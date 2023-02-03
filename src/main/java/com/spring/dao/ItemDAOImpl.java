package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dto.ItemDetailVO;
import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;

@Service
public class ItemDAOImpl implements ItemDAO{
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring.mapper.itemMapper";
    
    @Override
    public void register(ItemVO itemVo) throws Exception{
    	sqlSession.insert(Namespace+".setitem",itemVo);
    }
    
    @Override
    public void registerDetail(ItemDetailVO itemDetailVo) throws Exception{
    	sqlSession.insert(Namespace+".registerDetail",itemDetailVo);
    }
    
    @Override
    public List<ItemVO> list() throws Exception{
    	return sqlSession.selectList(Namespace+".selectItem");
    }
    
    @Override
    public List<ItemVO> searchItems(String nameItem) throws Exception{
    	return sqlSession.selectList(Namespace+".searchItems",nameItem);
    }
    
    @Override
    public ItemVO detailList(int idItem) throws Exception{
    	return sqlSession.selectOne(Namespace+".selectDetail",idItem);
    }
    
    @Override
    public ItemDetailVO getItemDetail(int idItem) throws Exception{
    	return sqlSession.selectOne(Namespace+".getItemDetail",idItem);
    }
    
    @Override
    public void delete(int idItem) throws Exception{
    	sqlSession.delete(Namespace+".deleteItem",idItem);
    }
    
    @Override 
    public ItemVO cartItem(int idItem) throws Exception{
    	return sqlSession.selectOne(Namespace+".selectDetail",idItem);
    }
    
    @Override
    public void update(ItemVO itemVo) throws Exception{
    	sqlSession.update(Namespace+".update",itemVo);
    }
    
    @Override
    public List<ItemVO> categoryList(String category) throws Exception{
    	return sqlSession.selectList(Namespace+".categoryList",category);
    }
}
