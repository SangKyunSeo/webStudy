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
    
    @Override
    public MemberVO login(MemberVO memberVo) {
    	return sqlSession.selectOne(Namespace+".login",memberVo);
    }
    @Override
    public String loginCheck(MemberVO memberVo) throws Exception{
    	return sqlSession.selectOne(Namespace+".login",memberVo);
    }

    @Override
    public MemberVO buyer(String id_member) throws Exception{
    	return sqlSession.selectOne(Namespace+".buyer",id_member);
    }
    
    @Override
    public void updateInfo(MemberVO memberVo) throws Exception{
    	sqlSession.update(Namespace+".update",memberVo);
    }
    
    @Override
    public MemberVO idcheck(String id_member) throws Exception{
    	return sqlSession.selectOne(Namespace+".idchk",id_member);
    }
}
