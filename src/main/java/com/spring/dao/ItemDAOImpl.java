package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

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
    public List<ItemVO> list() throws Exception{
    	return sqlSession.selectList(Namespace+".selectItem");
    }
    
    @Override
    public ItemVO detailList(int idItem) throws Exception{
    	return sqlSession.selectOne(Namespace+".selectDetail",idItem);
    }
    
    @Override
    public void delete(int idItem) throws Exception{
    	sqlSession.delete(Namespace+".deleteItem",idItem);
    }
}
