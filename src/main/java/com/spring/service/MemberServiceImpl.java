package com.spring.service;
import java.util.List;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;
 
import com.spring.dao.MemberDAO;
import com.spring.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
    private MemberDAO dao;
    
    @Override
    public void register(MemberVO memberVo) throws Exception{
    	dao.register(memberVo);
    }
}
