package com.spring.service;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
    
    @Override
    public String loginCheck(MemberVO memberVo, HttpSession session) throws Exception{
    	String name = dao.loginCheck(memberVo);
    	if(name!=null) {
    		session.setAttribute("userEmail", memberVo.getMemberId());
    		session.setAttribute(name, name);
    	}
    	return name;
    }
    
    @Override
    public void logout(HttpSession session) {
    	session.invalidate();
    }
}
