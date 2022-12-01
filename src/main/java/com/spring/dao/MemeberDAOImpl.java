package com.spring.dao;
import java.util.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dto.MemberVO;
@Service
public class MemeberDAOImpl implements MemberDAO{
	
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring.mapper.memberMapper";
    
    @Override
    public void register(MemberVO memberVo) throws Exception{
    	sqlSession.insert(Namespace+".register",memberVo);
    }

}
